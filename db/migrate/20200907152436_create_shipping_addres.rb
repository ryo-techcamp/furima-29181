class CreateShippingAddres < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addres do |t|
      t.string :postal_code ,null:false
      t.integer :prefecture ,null:false
      t.string :city ,null:false
      t.string :address ,null:false
      t.string :building_name ,null:false
      t.string :phone_number ,null:false
      t.integer :buyer_id ,null:false 
      t.timestamps
    end
  end
end
