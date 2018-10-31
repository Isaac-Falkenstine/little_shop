class OrdersController < ApplicationController
  def index
     @orders = current_user.orders
  end

  def new
     @order = Order.new
  end

  def create
    if session[:user_id] == nil
      redirect_to new_user_path
      flash[:notice] = "You must register or login to checkout."
    else
      @order = Order.create(user_id: session[:user_id])
      session[:cart].each do |key, value|
        item = Item.find(key.to_i)
         OrderItem.create!(order_id: @order.id, item_id: key.to_i, amount: item.price, count: value)
      end
      redirect_to profile_orders_path
    end
  end

  def show
    @order = Order.find(params[:user_id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :pakket, :verstuurt)
  end

end
