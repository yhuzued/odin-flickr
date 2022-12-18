class StaticPagesController < ApplicationController
  def home
    flickr = Flickr.new ENV['flickr_key'], ENV['flcikr_secret']
    begin
      id = params[:user_id]
      @photos = flickr.photos.search(user_id: id)
    rescue
      render static_pages_home_path, notice: "Something wrong"
    end
  end
end
