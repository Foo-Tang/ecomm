class ProducttypesController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Categories", producttypes_path
    @producttypes = Producttype.all
  end

  def show
    @producttype = Producttype.find(params[:id])
    add_breadcrumb "Categories", producttypes_path
    add_breadcrumb @producttype.name, wrestler_path(@producttype)
  end
end
