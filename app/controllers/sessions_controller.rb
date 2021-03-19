class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: user_params[:username].strip.downcase)
    if @user
      session[:user_id] = @user.id
      flash[:success] = 'You have successfully signed in'
      redirect_to user_path(@user)
    else 
      flash.now[:alert] = 'Username is not found! Please try again!'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
