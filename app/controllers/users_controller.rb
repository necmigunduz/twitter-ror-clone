class UsersController < ApplicationController
  before_action :require_user, :except=>[:new, :create]

  def new
    @user = User.new
    redirect_to root_path if signed_in?
  end

  def create
    @user = User.new(user_params)
   
    respond_to do |format|
        if @user.save
            flash[:notice] = 'User is successfully created.'
            redirect_to user_path(@user)
        else
            flash[:notice] = 'Something went wrong.'
            render :action => "new"
        end
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @opinions = @user.opinions
    @suggested_followers = @user.suggested_followers
  end

  def update
    @user = current_user
    @user.update(user_params)

    flash[:notice] = "Your profile is successfully updated!"
    redirect_to user_path(@user)
  end
end
