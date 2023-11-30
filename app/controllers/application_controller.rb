class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private

  def initialize_session
    session[:shopping_cart] ||= [] # empty of product IDs
  end

  def cart
    # you can pass an array of ids, and you'll get back the collection
    all_keys = session[:shopping_cart].flat_map(&:keys).uniq
    Product.find(all_keys)
  end
end
