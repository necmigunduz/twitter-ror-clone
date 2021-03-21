class UsersController < ApplicationController
  before_action :current_user_exist?, :except => [:create, :show, :new]
  
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
          redirect_to new_session_path
      else
          flash[:notice] = 'Something went wrong.'
          render :action => "new"
      end
  end

  def show
    @user = User.find_by(id: current_user.id)
    @opinions_current_user_friends = @user.friends_and_own_posts.ordered_by_most_recent
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
