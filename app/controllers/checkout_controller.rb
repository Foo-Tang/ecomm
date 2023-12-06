class CheckoutController < ApplicationController
  def create
    items = []
    order = Order.find(session[:order])
    subtotal = 0.00

    order.productorders.all? do |p|
      product = Product.find(p.product_id)
      if product.nil?
        redirect_to root_path
        return
      end
      subtotal += (p.sellprice * p.quantity)
      items << {
        price_data: {
          unit_amount: (p.sellprice * 100).to_i,
          currency: "cad",
          product_data: {
            name: product.name,
            description: product.description,
          },
        },
        quantity: p.quantity,
      }
    end

    taxes = (Taxcode.find(order.taxcode).applicable) * subtotal

    items << {
      price_data: {
        unit_amount: (taxes * 100).to_i,
        currency: "cad",
        product_data: {
          name: "Taxes",
        },
      },
      quantity: 1,
    }

    @session = Stripe::Checkout::Session.create(
      mode: "payment",
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      line_items: items,
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    #session = Stripe::Checkout::Session.retrieve(params[:session_id])
    #@payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    status = Orderstatus.where(:status => "paid").first
    Order.find(session[:order]).update(orderstatus_id: status.id, paymentid: params[:session_id], paytype: "credit")

    reset_session
    redirect_to root_path
  end

  def cancel
    redirect_to root_path
  end
end
