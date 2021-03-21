class OpinionsController < ApplicationController
  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)

    if @opinion.save
      flash[:notice] = "Your opinion is created successfully!"
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = "Your opinion is not created. Try again!"
    end
  end

  def show
  end

  private
  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
