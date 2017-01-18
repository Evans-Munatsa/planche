class StaticPagesController < ApplicationController
  def home
  	 # @posts = Post.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
      @posts = Post.all.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def about
  end
end
