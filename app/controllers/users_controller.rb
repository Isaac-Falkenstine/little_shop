class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update(update_params)
    redirect_to user_path(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :street_address, :city, :state, :zip, :email_address, :password)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :street_address, :city, :state, :zip, :email_address)
  end
end
