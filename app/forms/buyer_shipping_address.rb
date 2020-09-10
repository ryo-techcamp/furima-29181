class BuyerShippingAddress

  include ActiveModel::Model
  attr_accessor :token,:user_id,:item_id,:postal_code, :prefecture, :city, :address, :building_name, :phone_number, :buyer_id

  with_options presence: true do
  
    validates :postal_code,:prefecture,:city,:address,:phone_number, presence: true

    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    end
    # 「住所」の都道府県に関するバリデーション
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }


    validates :token, presence: true
  

    def save
      # 購入者の情報を保存
      buyer = Buyer.create(item_id: item_id, user_id: user_id)

      # 配送先の情報を保存
      ShippingAddres.create( postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name,phone_number: phone_number,buyer_id: buyer.id)
    end

  end
