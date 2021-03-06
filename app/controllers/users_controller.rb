class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
     @user = User.new(user_params)
     if @user.save && (Math.log10(user_params[:zip].to_i).to_i + 1 == 5)
       session[:user_id] = @user.id
       flash[:success] = "Welcome #{@user.first_name} to the Pubshop App!"
       redirect_to user_path(@user)
     else
       render :new
       flash[:notice] = "Register failed! Either that e-mail is taken or your address is invaild!"
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

  def index
    @users = User.all.order(:email_address)
  end

  def disable
    user = User.find(params[:id])
    if current_user.admin?
      user.disable_account
      redirect_to users_path
      flash[:notice] = "User account has been disabled"
    else
      redirect_to :back
    end
  end

  def enable
    user = User.find(params[:id])
    if current_user.admin?
      user.enable_account
      redirect_to users_path
      flash[:notice] = "User account has been enabled"
    else
      redirect_to :back
    end
  end

  def upgrade
    user = User.find(params[:id])
    if current_user.admin?
      user.upgrade_account(params[:dir])
      flash[:notice] = "User #{(params[:id])} has been upgraded" if (params[:dir] == "up")
      flash[:notice] = "User #{(params[:id])} has been downgraded" if (params[:dir] == "down")
      redirect_to users_path
    else
      redirect_to :back
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
