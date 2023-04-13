class Admin::OrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders.all
    @order_total_amount = 0
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_datails = OrderDatail.where(order_id: params[:id])
    if @order.update(order_status_params) && @order.status == "payment"
      @order_datails.update_all(making_status: 1)
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_status_params
    params.require(:order).permit(:status)
  end
end
