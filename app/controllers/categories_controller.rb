class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index 
        @categories = current_user.categories.all
    end

    def new
        @category = current_user.categories.build
    end

    def create
        @category = current_user.categories.build(category_params)

        if @category.save
            redirect_to categories_path
        else
            render :new
        end 
    end

    def show
        @category = current_user.categories.find(params[:id])
    end

    def edit
        @category = current_user.categories.find(params[:id])
    end

    def update
        @category = current_user.categories.find(params[:id])
        if @category.update(category_params)
            redirect_to category_path
        else
        render :edit
        end
    end

    def destroy
        @category = current_user.categories.find(params[:id])
        @category.delete

        redirect_to categories_path
    end


    private
        
    def category_params
        params.require(:category).permit(:title, :description)
    end
end
