class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart
  helper_method :categories

  private

  def initialize_session
    session[:shopping_cart] ||= [] # empty of product IDs
  end

  def categories
    @producttypes = Producttype.all
  end

  def cart
    # you can pass an array of ids, and you'll get back the collection
    Product.find(session[:shopping_cart])
  end
end
