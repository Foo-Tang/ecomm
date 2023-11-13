class ProducttypesController < ApplicationController
  def index
    @producttypes = Producttype.all
  end

  def show
    @producttype = Producttype.find(params[:id])
  end
end
