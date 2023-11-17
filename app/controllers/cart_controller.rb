class CartController < ApplicationController
  def create
    # log product to terminal
    logger.debug("Adding #{params[:id]} to cart")
    id = params[:id].to_i
    # pushes id onto the end of array
    session[:shopping_cart] << id unless session[:shopping_cart].include?(id)
    product = Product.find(id)
    flash[:notice] = "+ #{product.name} added to cart."
    end
    redirect_to root_path
  end

  def destroy
    logger.debug("Removing #{params[:id]} from cart")
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)

    flash[:notice] = "➖ #{product.name} removed from cart."
    redirect_to root_path
  end
end
