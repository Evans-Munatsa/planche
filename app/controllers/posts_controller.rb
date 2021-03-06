class PostsController < ApplicationController
  before_action :authenticate_superadmin!, only:[ :new, :edit, :update, :create, :destroy ]
  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]


  def index
    if params[:id].blank?
      @posts = Post.all.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    else
      @posts = Category.find(params[:id]).posts.order(:created_at)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    # @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post has been created."
      redirect_to @post
    else
      flash[:alert] = "Post has not been created."
      render 'new'
    end
  end

  def show
    commontator_thread_show(@post)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post has been updated."
      redirect_to @post
    else
      flash[:alert] = "Post has not been updated."
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def upvote
    @post.upvote_from current_user
    redirect_to root_path
  end

  def downvote
   @post.downvote_from current_user
   redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
