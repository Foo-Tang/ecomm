class CheckoutController < ApplicationController
  # POST /checkout/create
  def create
    # This is your test secret API key.
    Stripe.api_key = "sk_test_51OCsmqDB4b5KVkhHdUbGr1PD3VugudqKw11NWuYCJ41emrUH1QPrPY0WqAVHFeEnZqiZ7ExZ8H13CKgGAPKiNjxK008ON02smj"

    set :static, true
    set :port, 3000

    YOUR_DOMAIN = "http://localhost:3000"

    post "/create-checkout-session" do
      content_type "application/json"

    session = Stripe::Checkout::Session.create(
      {
        line_items:  [{
          # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
          price:    "price_1OFjWNDB4b5KVkhH6gUZ2Uap",
          quantity: 1
        }],
        mode:        "payment",
        success_url: YOUR_DOMAIN + "/success.html",
        cancel_url:  YOUR_DOMAIN + "/cancel.html"
      }
    )
    redirect session.url, 303
  end

  def success

    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    # Something went wrong with the payment :(
  end
end
