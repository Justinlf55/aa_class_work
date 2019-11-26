class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(login_params)
    login!
    if !logged_in?
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

private
  def login_params
    params.require(:user).permit(:username, :password)
  end
end
