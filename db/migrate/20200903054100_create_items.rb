class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image
      t.string :name
      t.text :description
      t.integer :genre_id ,null: false
      t.integer :sutum_id ,null: false
      t.integer :sora_id ,null: false
      t.integer :place_id ,null: false
      t.integer :day_id ,null: false
      t.integer :price
      t.integer :user_id
      t.timestamps
    end
  end
end
