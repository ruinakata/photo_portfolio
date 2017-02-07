class Tag < ActiveRecord::Base

  has_many :phototags
  has_many :photos, through: :phototags

end
