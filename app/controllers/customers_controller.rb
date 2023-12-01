class CustomersController < ApplicationController
  def index
    @provinces = Province.all
  end

  def create
  end
end
