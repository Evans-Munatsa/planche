class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post has been created."
      redirect_to @post
    else
      flash[:alert] = "Post has not been created."
      render 'new'
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
