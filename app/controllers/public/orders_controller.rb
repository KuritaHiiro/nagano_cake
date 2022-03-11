class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
  end

  def create
    @order = Order.new(order_params)
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address)
  end

end
