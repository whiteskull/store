class CartController < ApplicationController
  def index
      @cart = current_cart
  end

  def add_item
    product = Product.find(params[:product])
    cart = current_cart
    item = cart.add_item(product.id)
    if item.save
      redirect_to catalog_product_path(product.category.alias, product.alias), notice: "#{product.name} has been added to your cart"
    end
  end

  def remove_item
  end

  def destroy
  end
end
