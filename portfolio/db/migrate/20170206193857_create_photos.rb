class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
