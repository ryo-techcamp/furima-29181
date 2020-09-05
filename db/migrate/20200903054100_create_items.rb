class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name ,null:false
      t.text :description ,null:false
      t.integer :genre_id ,null: false
      t.integer :sutum_id ,null: false
      t.integer :sora_id ,null: false
      t.integer :place_id ,null: false
      t.integer :day_id ,null: false
      t.integer :price ,null:false
      t.integer :user_id ,null:false
      t.timestamps
    end
  end
end
