class ChargesController < ApplicationController

  def new
  end

  def create
    begin
      @amount = params[:amount].to_i * 100

      customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    else
      redirect_to root_path
    end
  end
end
