class OpinionsController < ApplicationController
  def new
    @post = 
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  def index
  end
end
