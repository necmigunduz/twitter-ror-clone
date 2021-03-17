class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
  end

  def index
  end

  def show
  end

  private

  # def user_params
  #   params.require(:user).permit(:username, :fullname, :photo, :coverImage)
  # end
end
