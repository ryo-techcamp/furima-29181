class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @user = current_user
  end
end
