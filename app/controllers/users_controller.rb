class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
<<<<<<< HEAD
=======
      flash[:success] = "Welcome #{@user.first_name} to the Pubshop App!"
>>>>>>> f7cbc828b02813827d0fa3adfc45b9f33a389dd3
      redirect_to user_path(@user)
    else
      render :new
    end
  end

<<<<<<< HEAD
  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update(update_params)
    redirect_to user_path(params[:id])
=======
  def show
    @user = User.find(params[:id])
    # should this be session id?
>>>>>>> f7cbc828b02813827d0fa3adfc45b9f33a389dd3
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :street_address, :city, :state, :zip, :email_address, :password)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :street_address, :city, :state, :zip, :email_address)
  end
end
