class CreatePhototags < ActiveRecord::Migration
  def change
    create_table :phototags do |t|

      t.timestamps null: false
    end
  end
end
