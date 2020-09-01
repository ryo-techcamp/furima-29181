class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @user = current_user
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    redirect_to action::index
  end

  def new
    @user = User.new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title,:text,:genre_id)
  end

end
