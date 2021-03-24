class FollowingsController < ApplicationController
  def create
    @following = Following.new(follower_id: current_user.id, followed_id: params[:followed_id])

    if @following.save
      flash[:notice] = "You have started following #{User.find(params[:followed_id]).fullname}"
      redirect_to root_path
    else
      flash[:notice] = 'Your request is not completed. Try again!'
    end
  end
end
