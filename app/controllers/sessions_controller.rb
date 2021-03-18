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
      flash.now[:alert] = 'Something wrong with the login information'
      render 'new'
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
