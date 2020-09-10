require 'rails_helper'

RSpec.describe BuyerShippingAddress, type: :model do
  describe '#create' do
    before do
      @shipping_address = FactoryBot.build(:shipping_address)
    end

  it "postal_codeが空では登録できないこと" do
    @shipping_address.postal_code = nil
    @shipping_address.valid?
    expect(@shipping_address.errors.full_messages).to include("postal_code can't be blank")
  end

  it "prefectureが空では登録できないこと" do
    @shipping_address.prefecture = nil
    @shipping_address.valid?
    expect(@shipping_address.errors.full_messages).to include("prefecture can't be blank")
  end

  it "city空では登録できないこと" do
    @shipping_address.city = nil
    @shipping_address.valid?
    expect(@shipping_address.errors.full_messages).to include("city can't be blank")
  end

  it "addressが空では登録できないこと" do
    @shipping_address.address = nil
    @shipping_address.valid?
    expect(@shipping_address.errors.full_messages).to include("address can't be blank")
  end

  it "building_nameが空では登録できないこと" do
    @shipping_address.building_name = nil
    @shipping_address.valid?
    expect(@shipping_address.errors.full_messages).to include("building_name can't be blank")
  end

  it "phone_number空では登録できないこと" do
    @shipping_address.phone_number = nil
    @shipping_address.valid?
    expect(@shipping_address.errors.full_messages).to include("phone_number can't be blank")
  end
end
