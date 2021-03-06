class CategoriesController < ApplicationController
  before_action :authenticate_superadmin!, only:[ :new, :edit, :update, :create, :destroy ]
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  def index
    if params[:category].blank?
      @category = Category.all.order('created_at DESC')
    else
      @post_id = Post.find_by(title: params[:category]).id
      @category = Category.where(category_id: @category_id).order("created_at DESC")
    end
  end


  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category has been created."
      redirect_to root_path
    else
      flash[:alert] = "Category has not been created."
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category has been updated."
      redirect_to root_path
    else
      flash[:alert] = "Category has not been updated."
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :user_id)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
