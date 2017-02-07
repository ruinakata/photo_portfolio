class TagsController < ApplicationController

  def determine_tags
    tags = Tag.all
    # copied into photos_controller as well
    # hardcoding allowed tags for now until they fill up
    # remove from here down and update tags=Tag.all to @tags=Tag.all
    tags_to_show = ["dogs", "sweet", "savory", "portrait", "scenery"]
    @tags = []
    tags.each do |tag|
      if tags_to_show.include?(tag.name)
        @tags << tag
      end 
    end
    return @tags
  end

  def index
    @tags = determine_tags
  end

  def show
    @tags = determine_tags
    @tag = Tag.find(params[:id])
    photos = Photo.all
    @photos = []
    photos.each do |photo|
      if photo.tags.include?(@tag)
        @photos << photo
      end
    end
  end

end
