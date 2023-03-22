class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new(params[:id])
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).parmit(:item_id, :amount)
  end
end
