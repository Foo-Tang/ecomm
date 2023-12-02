class CustomersController < ApplicationController
  def new
    @customer = Customer.new
    @provinces = Province.all
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      session[:customer] = customer.id
      redirect_to new_order_path
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :address, :province_id, :postal_code)
  end
end
