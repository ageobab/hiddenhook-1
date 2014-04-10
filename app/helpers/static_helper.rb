module StaticHelper
  def total_cost(order_id)
    total = 0
    @order = Order.find(order_id)
    @order.line_items.each do |item|
      total += item.price
    end
    total
  end
  def items(order_id)
    items = []
    @order.line_items.each do |item|
      items << LineItem.find(item.id).name
    end
    items
  end
end
