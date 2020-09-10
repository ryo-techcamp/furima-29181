class ShippingAddressController < ApplicationController
  # before_action :set_item, only: [:index, :new, :create, :pay_item]

  def index
    @item =Item.find(params[:item_id])
    @shipping_address = BuyerShippingAddress.new
  end


  def create
    @item =Item.find(params[:item_id])
    @shipping_address = BuyerShippingAddress.new(shipping_params)
    if @shipping_address.valid?
      pay_item
      @shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

private

# def set_item
#   @item = Item.find(params[:item_id])
# end

def shipping_params
  params.permit(:shipping_address,:token,:postal_code,:prefecture,:city,:address,:building_name,:phone_number,:item_id).merge(user_id: current_user.id)
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: shipping_params[:token],    # カードトークン
    currency:'jpy'                 # 通貨の種類(日本円)
  )
end

end
