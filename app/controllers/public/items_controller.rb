class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end


  def show
    @item = Item.find(params[:id])
    @cart_items = @item.cart_items
  end
end