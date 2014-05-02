class EvilcatController < ApplicationController
  def index
    @links = Link.all
  end
end
