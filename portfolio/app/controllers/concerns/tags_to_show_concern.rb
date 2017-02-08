module TagsToShowConcern
  extend ActiveSupport::Concern

  included do
    helper_method :tags_to_show
  end

  def tags_to_show
    @photos = Photo.all
    # copied into tags_controller as well
    tags = Tag.all
    # hardcoding allowed tags for now until they fill up
    # remove from here down and update tags=Tag.all to @tags=Tag.all
    tags_to_show = ["dogs", "sweet", "savory", "portrait", "scenery", "foodstyling"]
    @tags = []
    tags.each do |tag|
      if tags_to_show.include?(tag.name)
        @tags << tag
      end 
    end
    return @tags
  end

end