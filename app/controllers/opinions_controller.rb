class OpinionsController < ApplicationController

  def create
    @opinion = current_user.opinions.build(opinion_params)

    if @opinion.save
      flash[:notice] = "Your opinion is created successfully!"
      redirect_to root_path
    else
      flash[:notice] = "Your opinion is not created. Try again!"
    end
  end

  private
  def opinion_params
    params.require(:user).permit(:text)
  end
end
