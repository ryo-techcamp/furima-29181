class ShippingAddre < ApplicationRecord
  validates :postal_code,:prefecture,:city,:address,:buildding_name,:phone_number,:buyer_id, presence: true
end
