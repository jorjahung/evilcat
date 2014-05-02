class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    Link.create(link_params)
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
