class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @user = current_user
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def item_params
    params.require(:item).permit(:image,:name, :description, :genre_id, :sutum_id, :sora_id, :place_id, :day_id, :price).merge(user_id: current_user.id)
  end
end

