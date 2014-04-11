class PublicController < ApplicationController
  before_action :set_order
  private
  def set_order
    if session[:order_id].nil?
      order = Order.create
      session[:order_id] = order.id
    end
  end
end
