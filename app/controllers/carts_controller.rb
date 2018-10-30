class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents


    quantity = @cart.count_of(item.id)
    flash[:notice] = "You Have #{quantity} Number Of #{item.name} In Your Cart"
    redirect_to items_path
   end

   def index
    @items = @cart.contents.keys.map do |item_id|
      item = Item.find(item_id)
    end
  end
end
