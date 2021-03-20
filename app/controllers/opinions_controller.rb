class OpinionsController < ApplicationController
  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)

    if @opinion.save
      flash[:notice] = "Your opinion is created successfully!"
      redirect_to opinions_show_path
    else
      flash[:notice] = "Your opinion is not created. Try again!"
    end
  end
  def show

    @user = User.find_by(id: session[:user_id])
    @opinions = @user.opinions
  end

  private
  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
