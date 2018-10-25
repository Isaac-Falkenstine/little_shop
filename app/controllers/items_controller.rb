class ItemsController < ApplicationController

  def index
    @items = Item.all
    # @user = User.find(params[:id])
    
  end
end
