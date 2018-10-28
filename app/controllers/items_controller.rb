class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  # def create
  #   @item = Item.new
  #   if @item.save
  #     redirect_to (dashboard_user_path(merchant))
  #   else
  #     render :new
  #   end
  # end

end
