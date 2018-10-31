class OrderItemsController < ApplicationController
  # def index
  #   binding.pry
  #    @order_items = OrderItem.all

  # end

  # def new
  #    @order_item = OrderItem.new
  # end

  # def create
  #   @order_item = OrderItem.create(user_id: session[:user_id], item_id: item.id, order_id: order.id, amount: 20=, count: 20)

  #   session[:cart].each do |key, value|
  #     item = Item.find(key.to_i)
  #     OrderItem.create(order_id: order.id, item_id: key.to_i, count: value, amount: item.price)
  #   end
  #   redirect_to profile_orders_path(current_user)
  # end

  # end

  # def show
  #  @order_item = OrderItem.find(params[:user_id]) 
  # end

  # private
  # def order_item_params
  #   params.require(:order_item).permit(:user_id, :item_id, :order_id, :amount, :count)
  # end
end