class ItemsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @user = current_user
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    redirect_to action::index
  end

  def new
    @item = Item.new
    # @item.item_imgs.new
    # @article = Article.new
    # @status = Status.new
    # @shippingfee = Shippingfee.new
    # @shipping = Shipping.new
    # @shippingday = Shippingday.new
  end

  def create
    @item =Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
    render :new 
    end

  end

#  private

  # def item_params
  #   params.require(:item).permit(
  #     :image, 
  #     :name, 
  #     :description, 
  #     :name,
  #     :status,
  #     :shippingfee,
  #     :shipping,
  #     :shippingday,
  #     :price, :user_id,
  #     images_attributes: [{image: []}, :product_id, :id, :image],
  #   ).merge(
  #     user_id: current_user.id, 
  #   )


#  def item_params
#   params.require(:item).permit(:image,:name, :description, :category, :status, :delivery_fee, :shipping_origin, :date_of_shipment, :price)
#   end

  # def create
  #   @article = Article.new(article_params)
  #   if @article.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # def create
  #   @status = Status.new(status_params)
  #   if @status.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # def create
  #   @shippingfee = Shippingfee.new(shippingfee_params)
  #   if @sippingfee.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # def create
  #   @shipping = Shipping.new(shipping_params)
  #   if @shipping.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # def create
  #   @shippingday = Shippingday.new(shippingday_params)
  #   if @shippingday.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # private

  def item_params
    params.require(:item).permit(:image,:name, :description,:genre_id,:sutum_id,:sora_id,:place_id,:day_id,:price,:current_user_id)
  end

  # def status_params
  #   params.require(:status).permit(:sutum_id)
  # end

  # def shippingfee_params
  #   params.require(:shippingfee).permit(:title,:text,:sora_id)
  # end

  # def shipping_params
  #   params.require(:shipping).permit(:title,:text,:place_id)
  # end

  # def shippingday_params
  #   params.require(:shippingday).permit(:title,:text,:day_id)
  # end

end

