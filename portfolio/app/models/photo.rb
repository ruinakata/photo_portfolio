class Photo < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  has_many :phototags
  has_many :tags, through: :phototags

end
