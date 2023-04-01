class Admin::OrderDatailsController < ApplicationController
  def update
    @order_datail = OrderDatail.find(params[:id])
    @order = @order_datail.order
    @order_datails = @order.order_datails.all

    is_updated = true
    if @order_datail.update(making_status_params) && @order_datail.making_status == "manufacture"
      @order.update(status: 2)
    end
    @order_datails.each do |order_datail|
      if order_datail.making_status != "completion"
        is_updated = false
      end
    end
    @order.update(status: 3) if is_updated

    redirect_to admin_order_path(@order.id)
  end

  private

  def making_status_params
    params.require(:order_datail).permit(:making_status)
  end
end
