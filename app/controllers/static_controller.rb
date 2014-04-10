class StaticController < PublicController
  def index
    @products = Product.all
    @order = Order.find(session[:order_id])
    @line_items = @order.line_items
  end
end
