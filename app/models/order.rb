class Order < ApplicationRecord
  enum payment_method: {
    credit: 0,
    bank: 1,
  }

  enum status: {
    payment_waiting: 0,
    payment_confirmation: 1,
    in_production: 2,
    preparing_delivery: 3,
    delivered: 4,
  }

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  def postage
    800
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end


end
