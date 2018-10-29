class Dashboard::ItemsController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id)
    @user = current_user
  end

  def new
    @item = Item.new
  end
end
