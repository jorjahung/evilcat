class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    link  = Link.create(link_params)
    html  = link.url
    kit   = IMGKit.new(html)
    img   = kit.to_img(:png)
    file  = Tempfile.new(["template_#{link.id}", '.png'], 'tmp',
                         :encoding => 'ascii-8bit')
    file.write(img)
    file.flush
    link.screenshot = file
    link.save
    file.unlink
    
    # link.save

    redirect_to root_path
  end

  def show
    @link = Link.find(params[:id])
  end

  private
  def link_params
    params.require(:link).permit(:name, :url, :description)
  end
end
