class LineItemsController < PublicController

  def create
    @product = Product.find(params[:product_id])
    @order = Order.find(session[:order_id])
    how_many(@order, @product)
    redirect_to 'http://localhost:3000/', notice: 'Added to order'
  end

  def destroy
    session[:order_id] = nil
    redirect_to root_path
  end

  def how_many(order, product)
    if order.line_items.map(&:name).include?(product.name)
      q = LineItem.find(order.line_items.where(name: product.name)).quantity + 1
      LineItem.find(order.line_items.where(name: product.name)).update_attributes(quantity: q)
    else
      line_item = @order.line_items.build(name: @product.id, price: @product.price)
      line_item.copy_product_attributes(@product)
      line_item.save
    end
  end
end


