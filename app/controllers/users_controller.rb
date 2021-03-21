class UsersController < ApplicationController
 # before_action :require_user, :except=>[:new, :create, :index]
  before_action :current_user_exist?, :include => [:show]
  
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params) 
      if @user.save
          flash[:notice] = 'User is successfully created.'
          redirect_to user_path(@user)
      else
          flash[:notice] = 'Something went wrong.'
          render :action => "new"
      end
  end

  def show
    @user = User.find_by(id: current_user.id)
    @opinions = @user.opinions.ordered_by_most_recent
  end

  def update
    @user = current_user
    @user.update(user_params)

    flash[:notice] = "Your profile is successfully updated!"
    redirect_to user_path(@user)
  end

  private 
  def user_params
    params.require(:user).permit(:username, :fullname)
  end
end
