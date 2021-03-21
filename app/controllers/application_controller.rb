class ApplicationController < ActionController::Base
  
  helper_method :current_user
  helper_method :signed_in?
  helper_method :current_user_exist?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_user_exist?
    if current_user.nil?
      redirect_to new_user_path
    end
  end

  def signed_in?
    !current_user.nil?
  end

  private

  def require_user
    return if signed_in?

    flash[:error] = 'You need to log in to complete this action!'
    redirect_to root_path
  end

  def user_params
    params.permit(:username, :fullname)
  end
end
