class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  def new
    @category=Category.new
  end

  def index
    @categories=Category.all
  end

  def show
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def update
    if @category.update_attributes(category_params)
      flash[:notice] = 'Updated category successfully!'
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def create
    @category = Category.new(category_params) 
    if @category.save
      flash[:notice] = 'Created category successfully!'
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
  end

  private
  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end





