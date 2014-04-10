class LineItemsController < PublicController

  def create
    @product = Product.find(params[:product_id])
    @order = Order.find(session[:order_id])
    line_item = @order.line_items.build(name: @product.id, price: @product.price)
    line_item.copy_product_attributes(@product)
    line_item.save
    redirect_to 'http://localhost:3000/', notice: 'Added to order'
  end
  private
  # def line_item_params
  #   params.require(:line_item).permit(:name, :price)
  # end
end


