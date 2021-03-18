class ApplicationController < ActionController::Base
    before_action :require_login
    helper_method :current_user
    helper_method :signed_in?
    
    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def signed_in?
        !current_user.nil?
    end

    private 

    def require_login
        return if signed_in?

        flash[:error] = "You need to log in to complete this action!"
        redirect_to root_path
    end

    def user_params
        params.require(:user).permit(:username)
    end

end
