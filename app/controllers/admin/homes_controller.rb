class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
    @item_sum = 0
  end

end
