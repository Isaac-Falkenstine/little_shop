class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email_address: params[:email_address])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "LOGIN FAILED - try again"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    # session.clear to clear the cart maybe?
    flash[:notice] = "You have been logged out"
    redirect_to '/'
  end
end
