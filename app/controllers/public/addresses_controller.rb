class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new(address_params)
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = address.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.permit(:name, :postal_code, :address)
  end

end
