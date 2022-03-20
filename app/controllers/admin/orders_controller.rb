class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order_detail = OrderDetail
    @customer = @order.customer
    @sum = 0
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name, :postage, :total_payment, :customer_id)
  end
end
