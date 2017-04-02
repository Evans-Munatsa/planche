class CommentsController < ApplicationController
	before_action :authenticate_user!, only:[ :create ]

  def index
    @comments = Comment.all
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
    	flash[:notice] = "Comment created"
        redirect_to post_path(@post)
    else
    	flash[:alert] = "You need to be logged in to be able to comment"
    	redirect_to post_path(@post)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
