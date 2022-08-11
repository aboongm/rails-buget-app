class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @categories = Category.where(user_id: current_user.id)
  end
  
  def show
    @expenses = Expense.all.where(category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_path(@category), notice: 'Category was successfully created.' }
      else
        format.html {render :new, status: unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Category was successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_path(@category), notice: 'Category was successfully updated.' }
      else
        format.html { render :edit, status: unprocessable_entity }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
