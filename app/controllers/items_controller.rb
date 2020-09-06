class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item,only: [:show,:edit,:update]
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

  def edit
  end

  def show
  end

def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
end

def destroy
item = Item.find(params[:id])
if item.destroy
redirect_to root_path
else
render :edit
end
end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


  def item_params
    params.require(:item).permit(:image,:name, :description, :genre_id, :sutum_id, :sora_id, :place_id, :day_id, :price).merge(user_id: current_user.id)
  end

def set_item
  @item = Item.find(params[:id])
end

end

