class Dashboard::ItemsController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id)
    @user = current_user
  end

  def new
    @item = Item.new
  end
<<<<<<< HEAD

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      session[:item_id] = @item.id
      flash[:success] = "Item #{@item.name} has been saved"
      redirect_to dashboard_items_path
    else
      render :new
      flash[:notice] = "failed! "
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :thumbnail, :price, :inventory)
  end

=======
>>>>>>> d72b5a417d438b8a3e204d6fc29d04fb3b9c8582
end
