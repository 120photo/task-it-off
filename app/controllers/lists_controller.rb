class ListsController < ApplicationController
  def index
    @lists = List.all
    @my_lists = users_list
  end

  def show
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)
  end

  private

  def list_params
    params.require(:name)
  end

  def users_list
    @list = List.all.where(user_id: current_user.id)
    return @list
  end
end
