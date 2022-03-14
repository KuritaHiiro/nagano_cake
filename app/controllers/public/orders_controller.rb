class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    #@customer = Customer.find(params[:id])
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = current_customer.orders
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to confirm_path
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show

  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address)
  end

end
