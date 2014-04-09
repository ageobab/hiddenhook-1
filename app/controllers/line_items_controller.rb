class LineItemsController < PublicController



  def create
    @product = Product.find(params[:product_id])
    @order = Order.find(session[:order_id])
    line_item = @order.line_items.build(line_item_params)
    line_item.copy_product_attributes(@product)
    line_item.save
    redirect_to 'http://localhost:3000/#contact', notice: 'Added to order'

  end


  private

  def line_item_params
    raise
    params.require(:line_item).permit(:name, :price)
  end

end
