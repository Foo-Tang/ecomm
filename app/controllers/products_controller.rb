class ProductsController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @products = Product.order(:name).page params[:page]
  end

  def search
    if params[:search].present?
      @products = Product.where("name LIKE ?", "%#{params[:search].downcase}%")
    end

    return unless params[:set].present? && params[:set] != "All Categories"

    @products = Product.where("name LIKE ?",
                              "%#{params[:search].downcase}%").where(producttype_id: params[:set])
  end

  def new
    add_breadcrumb "New", products_path
    @products = Product.where("created_at >= ?", 3.days.ago).page params[:page]
  end

  def updated
    add_breadcrumb "Updated", products_path
    @products = Product.where("updated_at >= ?", 3.days.ago).where.not("created_at >= ?",
                                                                       3.days.ago).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
    add_breadcrumb "Products", products_path
    add_breadcrumb @product.name, product_path(@product)
  end
end
