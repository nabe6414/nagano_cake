class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @order_total_amount = 0
  end
end
