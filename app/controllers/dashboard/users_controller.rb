class Dashboard::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @best_user = @user.best_user
  end
end
