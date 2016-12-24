class StaticPagesController < ApplicationController
  def home
  	 @posts = Post.all
  end

  def about
  end

  def contact
  	 @posts = Post.all
  end
end
