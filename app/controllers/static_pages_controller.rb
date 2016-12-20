class StaticPagesController < ApplicationController
  def home
  	 @posts = Post.all
  	 @categories = Category.all	
  end

  def about
  end

  def contact
  end
end
