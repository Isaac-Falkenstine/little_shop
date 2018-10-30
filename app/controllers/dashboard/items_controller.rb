class Dashboard::ItemsController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id).order(:name)
    @user = current_user
  end

  def new
    @item = Item.new
  end

end
