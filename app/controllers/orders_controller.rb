class OrdersController < ApplicationController
  def index
  
     @orders = Order.where(params[:id])
    
  end

  def new
     @order = Order.new
  end

 def create
  @order = Order.new(order_params)
  if @order.save
    flash[:notice] = "Order created successfully"
    redirect_to(:action => 'index')
  end
 end

  end

  def show
   @order = Order.find(params[:user_id]) 
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :pakket, :verstuurt)
  end