class ProductsController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @products = Product.order(:name).page params[:page]
  end

  def new
    add_breadcrumb 'New', products_path
    @products = Product.where('created_at >= ?', 2.days.ago).page params[:page]
  end

  def updated
    add_breadcrumb 'Updated', products_path
    @products = Product.where('updated_at >= ?', 2.days.ago).where.not('created_at >= ?', 2.days.ago).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
    add_breadcrumb 'Products', products_path
    add_breadcrumb @product.name, product_path(@product)
  end
end