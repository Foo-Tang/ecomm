class OrdersController < ApplicationController
  def new
    order = Order.new()
    order.customer = Customer.find(session[:customer])
    order.paytype = 'credit'
    order.save

    subtotal = 0.00
    session[:shopping_cart].each do |id|
      product = Product.find(id)
      order.productorders.create(product_id: product.id, sellprice: product.price, quantity: 1)
      subtotal += product.price
    end

    @taxes = subtotal * 0.05
    @customer = order.customer

  end

  def create
  end
end
