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
      # payment_method_types: ["card"],
      mode:                 "payment",
      success_url:          checkout_success_url + "?session_id={checkout_session_id}",
      cancel_url:           checkout_cancel_url,
      line_items:           items,
      #tax_id_collection:    { enabled: true }
      # customer_update:             {
      #   name:    "auto",
      #   address: "auto"
      # },
      # shipping_address_collection: { allowed_countries: ["CA"] }
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    #Stripe::Checkout::Session.retrieve(params[:session_id])
    #@payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    reset_session
    redirect_to root_path
  end

  def cancel; end
end
