class ApplicationController < ActionController::Base

  before_filter :get_cart

  protect_from_forgery

  # get current cart if not exists then create
  def current_cart
    if session[:cart_id].nil?
      cart = Cart.create
      session[:cart_id] = cart.id
    else
      cart = Cart.find(session[:cart_id])
    end
    cart
  end

  private

  def get_cart
    @cart = current_cart
  end
end
