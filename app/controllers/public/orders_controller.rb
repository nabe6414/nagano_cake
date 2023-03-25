class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
  end

  def create
  end

  def index
  end

  def show
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method)
  end
end
