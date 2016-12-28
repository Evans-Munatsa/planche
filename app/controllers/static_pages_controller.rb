class StaticPagesController < ApplicationController
  def home
  	 @posts = Post.all
  end

  def about
  	 @posts = Post.all
  end

  def contact
  	 @posts = Post.all
  end
end
