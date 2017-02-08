class TagsController < ApplicationController
  include TagsToShowConcern

  def index
    @tags = tags_to_show
  end

  def show
    @tags = tags_to_show
    @tag = Tag.find(params[:id])
    photos = Photo.all
    @photos = []
    photos.each do |photo|
      if photo.tags.include?(@tag)
        @photos << photo
      end
    end
    @photos = @photos.reverse
  end

end
