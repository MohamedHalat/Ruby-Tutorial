class SessionsController < ApplicationController
  def new
    # @user = User.find(params[:id])
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user
    else
      render :new
    end
  end

  def user_params
    params.require(:session).permit(:email)
  end

  def destroy
  end
end
