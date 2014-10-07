class ListsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @page_name = 'Your Task List(s)'
    @list = List.all
    @my_lists = users_list
    @due_three_days = three_days
  end

  def show
    # /list/:id shows task that belong
    # to a particular task list
    @list = List.find(params[:id])
    @page_name = @list.name
    # task that belong to list and are not expired
    @lists_tasks = Task.all.where(list_id: params[:id], expired: false)
    @task = Task.new
    @due_three_days = three_days
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    @list.save
    redirect_to lists_url
  end

  def edit
    @list = List.find(params[:id])
    @page_name = @list.name
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      flash[:notice] = "List updated."
      redirect_to [@list]
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :public)
  end

  def users_list
    if current_user
      @list = List.all.where(user_id: current_user.id)
      return @list
    end
  end

  def three_days
    task = []
    Task.where("created_at <= ?", Time.now - 3.days).each do |item|
      task << item.name
    end
    return task
  end
end
