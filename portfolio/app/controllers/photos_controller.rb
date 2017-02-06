class PhotosController < ApplicationController

def new
end

def create
  render plain: params["photo"]["title"].inspect
end

end
