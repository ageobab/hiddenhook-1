class LineItem < ActiveRecord::Base
  belongs_to :order
  
  # takes a product object
  # and copies the attributes needed from product to self
  def copy_product_attributes(product)
    self.name = product.name
    self.price = product.price
  end
end
