class HomeController < ApplicationController
  def index
    @page_name = 'Task if Off'
  end

  def about
    @page_name = 'About Task it Off'
  end
end
