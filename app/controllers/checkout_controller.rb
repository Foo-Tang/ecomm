class CheckoutController < ApplicationController
  def create
    # # DONT EVEN BOTHER CONTINUING IF SOMEONE IS MESSING WITH US
    # if product.nil?
    #   redirect_to root_path
    #   return
    # end

    items = []
    session[:shopping_cart].each do |id|
      product = Product.find(id)
      if product.nil?
        redirect_to root_path
        return
      end
      items << {
        price_data: {
          unit_amount:  (product.price * 100).to_i,
          currency:     "cad",
          product_data: {
            name:        product.name,
            description: product.description
          }
        },
        quantity:   1
      }
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      mode:                 "payment",
      success_url:          root_url,
      cancel_url:           root_url,
      line_items:           items # + [
      #   {
      #     name: 'GST',
      #     description: 'Goods and Services Tax',
      #     amount: 4, #(product.price_cents * 0.05).to_i,
      #     currency: 'cad',
      #     quantity: 1
      #   }
      # ]
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel; end
end
