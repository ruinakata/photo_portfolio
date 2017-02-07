class AddColumnToPhotoTag < ActiveRecord::Migration
  def change
    add_column :phototags, :photo_id, :integer
    add_column :phototags, :tag_id, :integer
  end
end
