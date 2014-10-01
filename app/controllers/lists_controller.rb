class ListsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @page_name = 'Your Task List(s)'
    @list = List.all
    @my_lists = users_list
  end

  def show
    @list = List.all.where(list_id: params[:id])
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
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def users_list
    if current_user
      @list = List.all.where(user_id: current_user.id)
      return @list
    end
  end
end
