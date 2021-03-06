class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category
    skip_before_action :get_category, only: [:daily]
    skip_before_action :authenticate_user!, only: [:daily]

    def daily
        if user_signed_in?
            @categories = current_user.categories.all
            @tasks = []
            @categories.each do |category|
                @tasks += category.tasks.where(due_date: Date.today)
            end
            @tasks = @tasks.sort_by(&:priority)
        end

    end

    # def index
    #     @tasks = @category.tasks.sort(:priority)
    # end

    def new
        @task = @category.tasks.build 
    end

    def create
        @task = @category.tasks.build(task_params)

        if @task.save
            redirect_to category_path(@category), notice: "Task Successfully Created"
        else
            render :new
        end 
    end

    def show
        @task = @category.tasks.find(params[:id])

        respond_to do |format|
            format.html
            format.js
        end
    end

    def edit 
        @task = @category.tasks.find(params[:id])
        session[:return_to] ||= request.referer
    end

    def update
        @task = @category.tasks.find(params[:id])
        if @task.update(task_params)
            # redirect_to category_path(@category), notice: "Task Successfully Updated"
            flash[:notice] = "Task Successfully Updated"
            if session[:return_to]
                redirect_to session.delete(:return_to)
            else
                redirect_back(fallback_location: root_path)
            end
        else
            render :edit
        end
    end

    def destroy
        @task = @category.tasks.find(params[:id])
        @task.delete

        redirect_to category_path(@category), notice: "Task Successfully Deleted"
    end

    private

    def task_params
        params.require(:task).permit(:title, :description, :category_id, :priority, :due_date, :completed)
    end

    def get_category
        @category = current_user.categories.find(params[:category_id])
    end
end
