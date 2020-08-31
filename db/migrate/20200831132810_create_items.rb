class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image
      t.string :name
      t.text :description
      t.integer :category
      t.integer :status
      t.integer :delivery_fee
      t.integer :shipping_origin
      t.integer :date_of_shipment
      t.integer :price
      t.integer :user_id
      t.timestamps
    end
  end
end
