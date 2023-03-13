class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
  end
  
  private
  
  def order_params
  end
end
