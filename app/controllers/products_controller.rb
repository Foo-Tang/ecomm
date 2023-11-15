class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page params[:page]
  end

  def new
    @products = Product.where('created_at >= ?', 2.days.ago).page params[:page]
  end

  def updated
    @products = Product.where('updated_at >= ?', 2.days.ago).where.not('created_at >= ?', 2.days.ago).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end
end