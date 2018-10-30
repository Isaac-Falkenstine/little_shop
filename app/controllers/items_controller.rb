class ItemsController < ApplicationController

  def index
    @items = Item.where(enabled: true)
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      session[:item_id] = @item.id
      flash[:success] = "Item #{@item.name} has been created and saved"
      redirect_to dashboard_items_path
    else
      render :new
      flash[:notice] = "Item could not be created!"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    if Item.find(params[:id]).update(update_params)
      redirect_to dashboard_items_path
      flash[:notice] = "Info succesfully edited!"
    else
      redirect_to edit_item_path(params[:id])
      flash[:notice] = "Update Failed! Please make sure no fields are left empty"
    end
  end

  def disable
    item = Item.find(params[:id])
    if current_user.merchant?
      item.disable_item
      flash[:notice] = "Item is no longer for sale"
      redirect_to dashboard_items_path
    else
      redirect_to :back
    end
  end

  def enable
    item = Item.find(params[:id])
    if current_user.merchant?
      item.enable_item
      flash[:notice] = "Item is now available for sale"
      redirect_to dashboard_items_path
    else
      redirect_to :back
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :thumbnail, :price, :inventory)
  end

  def update_params
    params.require(:item).permit(:name, :price, :thumbnail, :inventory, :description)
  end
end
