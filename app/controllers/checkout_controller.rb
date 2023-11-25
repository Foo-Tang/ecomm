class CheckoutController < ApplicationController
  def create
    # Load up the product the user wishes to purchase from the product model:

    # product = Product.find(params[:product_id])

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
      items <<{
        price_data: {
          unit_amount: (product.price * 100).to_i,
          currency: 'cad',
          product_data: {
            name: product.name,
            description: product.description,
          },
        },
        quantity: 1
      }
    end

    @session = Stripe::Checkout::Session.create(
      # went to stripe API, looked up sessions, figured it all out..
      payment_method_types: ['card'],
      mode: 'payment',
      success_url: checkout_success_url + "?session_id={checkout_session_id}",
      cancel_url: checkout_cancel_url,
      line_items: items #+ [
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
    @session - Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
  end
end