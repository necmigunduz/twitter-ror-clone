class FollowingsController < ApplicationController
  def create
    @following = current_user.followings.new(followed_id: params[:user_id])

    if @following.save
      flash[:notice] = "You have started following #{User.find(params[:user_id]).fullname}"
      redirect_to root_path
    else
      flash[:notice] = "Your request is not completed. Try again!"
    end
  end
end
