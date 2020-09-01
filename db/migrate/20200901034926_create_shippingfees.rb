class CreateShippingfees < ActiveRecord::Migration[6.0]
  def change
    create_table :shippingfees do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :sora_id     , null: false
      t.timestamps
    end
  end
end
