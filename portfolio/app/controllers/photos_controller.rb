class PhotosController < ApplicationController

  def new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    # create an array of tags
    tags = params["photo"]["tags"]
    # tags should be in the format: #yolo #puppies
    tags = tags.split("#")
    stripped_tags = []
    tags.each do |tag|
      tag = tag.strip
      if tag.length > 0
        stripped_tags << tag
      end
    end
    params["photo"].delete :tags

    # create a photo
    puts "going to run photo.new"
    @photo = Photo.new(article_params)
    @photo.save
    puts @photo.errors.messages.inspect
    puts "Photo: #{@photo}"
    
    # if tags, populate tags
    stripped_tags.each do |tag|
      @tag = Tag.find_by_name(tag)
      if !@tag
        @tag = Tag.new({:name => tag})
        @tag.save
      end
      @tag.phototags.create(photo: @photo)
    end

    redirect_to @photo

  end

  private
  def article_params
    params.require(:photo).permit(:title, :description, :image)
  end

end
