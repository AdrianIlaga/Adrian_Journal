class TasksController < ApplicationController
    before_action :get_category

    def index
        @tasks = @category.tasks
    end

    def new
        @task = @category.tasks.build 
    end

    def create
        @task = @category.tasks.build(task_params)

        if @task.save
            redirect_to category_tasks_path
        else
            render :new
        end 
    end

    def show
        @task = @category.tasks.find(params[:id])
    end

    def edit 
        @task = @category.tasks.find(params[:id])
    end

    def update
        @task = @category.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to category_path
        else
        render :edit
        end
    end

    def destroy
        @task = @category.tasks.find(params[:id])
        @task.delete

        redirect_to category_path
    end

    private

    def task_params
        params.require(:task).permit(:title, :description, :category_id, :priority, :due_date)
    end

    def get_category
        @category = Category.find(params[:category_id])
    end
end
