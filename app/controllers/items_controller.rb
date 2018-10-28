class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = item.new(items_params)
    if @items.save 
      session[:items_id] = @items.id
      flash[:success] = "Welcome #{@items.first_name} to the Pubshop App!"
      redirect_to items_path(@items)
    else
      render :new
      flash[:notice] = "Register failed! Either that e-mail is taken or your address is invaild!"
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :thumbnail, :price, :inventory)
  end


end
