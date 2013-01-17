class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  attr_accessible :cart_id, :price, :product_id

  validates_numericality_of :quantity, greater_than_or_equal_to: 0
end
