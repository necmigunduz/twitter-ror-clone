class OpinionsController < ApplicationController
  before_action :current_user_exist?, :except => [:create, :show, :new]
  
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
  
  def index
    @user = User.find_by(id: current_user.id)
    @opinions_all = Opinion.all
  end 

  private
  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
