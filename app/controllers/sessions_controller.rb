class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email_address: params[:email_address])
    if @user == nil
      flash[:notice] = "LOGIN FAILED - try again"
      redirect_to login_path
    elsif !@user.authenticate(params[:password])
      flash[:notice] = "LOGIN FAILED - try again"
      redirect_to login_path
    elsif @user.enabled == false
      flash[:notice] = "Account disabled - contact site admin"
      redirect_to login_path
    else @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session[:user_id] = nil

    @cart.contents.clear
    flash[:notice] = "You have been logged out"
    redirect_to '/'
  end
end
