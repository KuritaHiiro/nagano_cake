class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    #情報入力画面,postメソッドで送る内容を保存するもの

    if params[:order][:select_address] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order = Order.new(order_params)
    end
    #@customer = current_customer
    #注文情報確認画面で表示する内容
    @customer = current_customer
    @cart_items = current_customer.cart_items
    @sum = 0
    #@orders = current_customer.orders
  end

  def create
    @order = Order.new(order_params)
    @customer = current_customer
    @cart_items = current_customer.cart_items
    @order.save
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price_tax = @order.total_payment
      @order_detail.amount = cart_item.amount
      @order_detail.production_status = 0
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order_detail = OrderDetail
    @sum = 0
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name, :postage, :total_payment, :customer_id)
  end

end
