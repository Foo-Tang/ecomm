class OrdersController < ApplicationController
  def new
    @customer = Customer.find(session[:customer])
    order = Order.new()
    order.customer = @customer
    order.taxcode = @customer.province.tax_code
    order.orderstatus = Orderstatus.where(:status => 'new').first
    order.save

    subtotal = 0.00
    session[:shopping_cart].each do |id|
      product = Product.find(id)
      item = order.productorders.create(product_id: product.id, sellprice: product.price, quantity: 1)
      subtotal += (item.sellprice * item.quantity)
    end

    @taxes = (Taxcode.find(order.taxcode).applicable) * subtotal
    session[:order] = order.id
  end

  def create
  end
end
