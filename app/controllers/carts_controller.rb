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
    @total_price = @cart.contents.map do |item_id, quantity|
      Item.find(item_id).price * quantity
    end.sum
  end

  def destroy
    @cart.contents.clear
    redirect_to cart_path
  end
end
