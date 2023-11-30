class CartController < ApplicationController

  def create
    id = params[:id].to_i
    qty = params[:qty].to_i

    if Product.find(id).stocklevel > qty
      unless session[:shopping_cart].include?(id)
        order = { id => qty}
        session[:shopping_cart] << order
        product = Product.find(id)
        flash[:notice] = "+ #{product.name} added to cart"
      else
        session[:shopping_cart][id] = qty
        flash[:notice] = "Quantity Updated"
      end
    else
      flash[:notice] = "Not Enough Stock"
    end
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "➖ #{product.name} removed from cart"
    redirect_to root_path
  end
end
