class Dashboard::ItemsController < ApplicationController
  def index
    @items = Item.where(user_id: params[:id]).order(:name)
    @user = User.find(params[:id])
  end

  def new
    @item = Item.new
  end

end
