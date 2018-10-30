class Dashboard::ItemsController < ApplicationController
  def index
    if current_user.role == 2
      @items = Item.where(user_id: params[:id]).order(:name)
      @user = User.find(params[:id])
    else
      @items = Item.where(user_id: current_user.id).order(:name)
      @user = current_user
    end
  end

  def new
    @item = Item.new
  end

end
