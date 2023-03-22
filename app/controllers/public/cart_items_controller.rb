class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
  end

  private

  def cart_item_params
    params.require(:cart_item).parmit(:item_id, :amount)
  end
end
