class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if Item.find(params[:id]).update(update_params)
      redirect_to dashboard_items_path
      flash[:notice] = "Info succesfully edited!"
    else
      redirect_to edit_item_path(params[:id])
    end
  end

  private

  def update_params
    params.require(:item).permit(:name, :price, :thumbnail, :inventory, :description)
  end
end
