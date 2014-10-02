class TasksController < ApplicationController
  def index
    @page_name = "List Tasks"
    @lists_tasks = Task.all.where(list_id: params[:list_id])
  end

  def show
  end

  def new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.save
    redirect_to lists_url
  end

  def edit
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
