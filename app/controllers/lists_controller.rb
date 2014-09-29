class ListsController < ApplicationController
  def index
    @list = List
    @my_lists = users_list
  end

  def show
  end

  def new
    @list = List.all
  end

  def edit
  end

  def create
    @list = List.all
  end

  private

  def list_params
    params.require(:name)
  end

  def users_list
    if current_user
      @list = List.all.where(user_id: current_user.id)
      return @list
    end
  end
end
