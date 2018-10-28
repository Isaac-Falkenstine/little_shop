class ItemsController < ApplicationController

  def index
    if current_user == nil || current_user.role == 0
      @items = Item.all
    elsif current_user.role == 1
      binding.pry
      @items = current_user.items
    end
  end
end
