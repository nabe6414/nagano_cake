class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
  end

  def update
  end

  private

  def order_status_params
    params.require(:order).permit(:status)
  end
end
