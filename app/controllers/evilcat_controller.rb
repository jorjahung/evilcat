class EvilcatController < ApplicationController
  def index
    @links = Link.all
    # url = 'http://bbc.co.uk'
    # @imgsrc = '/' + url.match(/http:\/\/(.+).co.uk/)[1] + '.jpg'
    # IMGKit.new(url).to_file('public' + @imgsrc)
  end
end
