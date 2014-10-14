class Lists::TasksController < ApplicationController

  before_filter :get_list

  def index
  end

  def show
  end

  def new
  end

  # used to create task in /list/:id
  def create
    @task = @list.tasks.build(task_params)
    @task.user = current_user
    @task.save
    redirect_to list_url(@list)
  end

  def edit
    @task = @list.tasks.find(params[:id])
    # redirect_to list_task_url
  end

  def update
    @task = @list.tasks.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:notice] = "Task updated."
      redirect_to [@list]
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  private

  def get_list
    @list = current_user.lists.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:name, :status)
  end
end
