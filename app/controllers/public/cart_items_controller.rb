class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    in_cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if in_cart_item
      in_cart_item.amount += params[:cart_item][:amount].to_i
      in_cart_item.save
      redirect_to cart_items_path
    else
      current_customer.cart_items.new(cart_item_params).save
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
