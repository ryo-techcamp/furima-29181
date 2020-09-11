class ShippingAddressController < ApplicationController
before_action :set_item, only: [:index,:create]
  def index
    @shipping_address = BuyerShippingAddress.new
  end


  def create
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


def shipping_params
  params.permit(:shipping_address,:token,:postal_code,:prefecture,:city,:address,:building_name,:phone_number,:item_id).merge(user_id: current_user.id)
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
  Payjp::Charge.create(
    amount: @item.price,  
    card: shipping_params[:token],    
    currency:'jpy'                 # 通貨の種類(日本円)
  )
end

def set_item
  @item = Item.find(params[:item_id])
end

end
