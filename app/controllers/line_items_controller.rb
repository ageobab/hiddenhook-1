class LineItemsController < PublicController

  def create
    @product = Product.find(params[:product_id])
    @order = Order.find(session[:order_id])
    line_item = @order.line_items.build(name: @product.name, price: @product.price)
    if line_item.save
      redirect_to root_path, notice: "#{@product.name} Added To Your Order"
    else
      redirect_to root_path, error: "We were unable to update your order."
    end
  end

  def destroy
    session[:order_id] = nil
    redirect_to root_path
  end
end


