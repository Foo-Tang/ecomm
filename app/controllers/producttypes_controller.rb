class ProducttypesController < ApplicationController
  def index
    @producttypes = Producttype.all
  end

  def show
  end
end
