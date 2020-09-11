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


  it "phone_number空では登録できないこと" do
    @shipping_address.phone_number = nil
    @shipping_address.valid?
    expect(@shipping_address.errors.full_messages).to include("phone_number can't be blank")
  end

  it "postal_code,prefecture,city,address,phone_numberが存在すれば登録できること" do
    expect(@shipping_address).to be_valid
  end

  it "phone_numberはハイフン不要で11桁以下であれば登録できる" do
    @shipping_address.phone_number = "12345678912"
    @shipping＿address.valid?
    @shipping_address.phone_number = "09023168811"
    expect(@shipping_address.errors.full_messages).to include("phone_number is too short (minimum is 11 characters)")
  end

  it "郵便番号にはハイフン必要" do
  @shipping_address.postal_code = "123-4567"
  end

  it "tokenが空では登録できないこと" do
    @shipping_address.token = nil
    @shipping_address.valid?
    expect(@shipping_address.errors.full_messages).to include("card_info can't be blank")
  end

end
end
