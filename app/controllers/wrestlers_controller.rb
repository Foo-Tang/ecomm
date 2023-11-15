class WrestlersController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Wrestlers", wrestlers_path
    @wrestlers = Wrestler.all
  end

  def show
    @wrestler = Wrestler.find(params[:id])
    add_breadcrumb "Wrestlers", wrestlers_path
    add_breadcrumb @wrestler.name, wrestler_path(@wrestler)
  end
end
