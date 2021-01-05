class SessionsController < ApplicationController
  def new
    if @current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user
      redirect_to @current_user
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome to the Sample App!"
      log_in user
      redirect_to user
    else
      flash[:danger] = "Failed Log in"
      render :new
    end
  end

  def user_params
    params.require(:session).permit(:email)
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
