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
       flash[:success] = "Welcome #{@user.first_name} to the Pubshop App!"

       redirect_to user_path(@user)
     else
       render :new
     end
   end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if User.find(params[:id]).update(update_params)
      redirect_to user_path(params[:id])
      flash[:notice] = "Info succesfully edited!"
    else
      redirect_to edit_user_path(params[:id])
      flash[:notice] = "That E-Mail is already in use!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :street_address, :city, :state, :zip, :email_address, :password)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :street_address, :city, :state, :zip, :email_address)
  end
end
