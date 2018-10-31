class OrdersController < ApplicationController
  def index  
     @orders = current_user.orders
  end

  def new
     @order = Order.new
  end

  def create
    order = Order.create(user_id: session[:user_id], status: :pending)

    session[:cart].each do |key, value|
      item = Item.find(key.to_i)
      # OrderItem.create(order_id: order.id, item_id: key.to_i, item_quantity: value, item_price: item.price)
      item_something.orders.create()
    end
    redirect_to profile_orders_path(current_user)
  end

  end

  def show
   @order = Order.find(params[:user_id]) 
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :pakket, :verstuurt)
  end