class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  # attr_accessible :title, :body

  # add item to cart or if it exists increase quantity
  def add_item(product_id)
    item = line_items.where(product_id: product_id).first
    if item.present?
      item.quantity += 1
      item
    else
      line_items.new(product_id: product_id)
    end
  end
end
