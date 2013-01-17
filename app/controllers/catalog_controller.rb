class CatalogController < ApplicationController
  def index
    @categories = Category.get_all
  end

  def category
    @category = Category.get_by_name(params[:category])
  end

  def product
    @product = Category.get_product(params[:category], params[:product])

    cart = current_cart

    @product_in_cart = cart.line_items.where(product_id: @product.id).first
  end
end
