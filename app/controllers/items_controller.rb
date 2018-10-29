class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      session[:item_id] = @item.id
      flash[:success] = "Item #{@item.name} has been created and saved"
      redirect_to dashboard_items_path
    else
      render :new
      flash[:notice] = "failed! Item could not be created"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :thumbnail, :price, :inventory)
  end


end
