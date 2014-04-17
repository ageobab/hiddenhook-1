class Order < ActiveRecord::Base
  has_many :line_items

  def total
    self.line_items.map(&:price).sum
  end

  def empty?
    self.line_items.empty?
  end
end
