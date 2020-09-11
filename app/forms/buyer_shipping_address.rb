class BuyerShippingAddress

  include ActiveModel::Model
  attr_accessor :token,:user_id,:item_id,:postal_code, :prefecture, :city, :address, :building_name, :phone_number, :buyer_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :city,:address,:phone_number
    validates :phone_number, length: { maximum: 11 }
  end

    validates :token, presence: true

    def save
      buyer = Buyer.create(item_id: item_id, user_id: user_id)
      ShippingAddres.create( postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name,phone_number: phone_number,buyer_id: buyer.id)
    end

  end
