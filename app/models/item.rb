class Item < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

validates :image, :name, :description, :category, :status, :delivery_fee, :shipping_origin, :date_of_shipment, :price presence: true

validates :price, :numericality => { :greater_than_or_equal_to => 300 }  
validates :price, :numericality => { :less_than => 9999999 } 

belongs_to :user
has_one :buyer
end
