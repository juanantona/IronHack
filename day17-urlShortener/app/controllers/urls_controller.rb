class UrlsController < ApplicationController

  def new
    @url = Url.new
  end


end