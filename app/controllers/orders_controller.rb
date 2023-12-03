class OrdersController < ApplicationController
  def new
    @customer = Customer.find(session[:customer])
    order = Order.new()
    order.customer = @customer
    order.paytype = 'credit'
    order.taxcode = @customer.province.tax_code
    order.save

    subtotal = 0.00
    session[:shopping_cart].each do |id|
      product = Product.find(id)
      order.productorders.create(product_id: product.id, sellprice: product.price, quantity: 1)
      subtotal += product.price
    end

    @taxes = (Taxcode.find(order.taxcode).applicable) * subtotal

  end

  def create
  end
end
