class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @categories = Category.where(user_id: current_user.id)
    end

    def show
        @category = Expense.all.where(category_id: @category.id)     
    end
    
    def new
        @category = Category.new
    end

    def edit
    end

    def create
        @category = Category.new(category_params)
        @category.user_id = current_user.id

        if @category.save
            respond_to do |format|
                format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
            else 
                format.html { render :new, status: :unprocessable_entity}
            end
        end
    end

    def update
        respond_to do |format|
            if @category.update(category_params)
                format.html { redirect_to category(@category), notice: "Category was successfully updated."}
            else 
                format.html { render :edit, status: :unprocessable_entity}
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