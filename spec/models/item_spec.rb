require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "descriptionが空では登録できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "categoryが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "statusが空では登録できないこと" do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "delivery_feeが空では登録できないこと" do
      @item.delivery_fee = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "shipping_originが空では登録できないこと" do
      @item.shipping_origin = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "date_of_shipmentが空では登録できないこと" do
      @item.date_of_shipment = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      expect(@item.errors.full_messages).to be_between(300, 9,999,999).inclusive
    end

    it "下限以下の場合" do
      @item.price = "100"
      @item.valid?
      expect(@item.errors.full_messages).to be_vaild include("minimum is 300 prices")
    end

    it "上限以上の場合" do
      @item.price = "1000000000"
      @item.valid?
      expect(@item.errors.full_messages).to be_vaild include("maximum is 9999999 prices")
    end

  end
end
