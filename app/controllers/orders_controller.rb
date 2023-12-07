class OrdersController < ApplicationController
  def new
    @customer = Customer.find(session[:customer])
    order = Order.new()
    order.customer = @customer
    order.taxcode = @customer.province.tax_code
    order.orderstatus = Orderstatus.where(:status => "new").first
    order.save

    @subtotal = 0.00
    taxrate = Taxcode.find(order.taxcode).applicable
    session[:shopping_cart].each do |id|
      product = Product.find(id)
      item = order.productorders.create(product_id: product.id, sellprice: product.price, quantity: 1, taxrate: taxrate)
      @subtotal += (item.sellprice * item.quantity)
    end

    @taxes = taxrate * @subtotal
    session[:order] = order.id
  end

  def create
  end
end
