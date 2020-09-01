class Item < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

validates :image, :name, :description, :category, :status, :delivery_fee, :shipping_origin, :date_of_shipment, :price presence: true

belongs_to :user
has_one :buyer
end
