class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
        if @user.save
            flash[:notice] = 'User is successfully created.'
            format.html { redirect_to user_path(@user) }
        else
            flash[:notice] = 'Something went wrong.'
            format.html { render :action => "new" }
        end
    end
  end

  def index
    @users = User.all
  end

  def show
  end

end
