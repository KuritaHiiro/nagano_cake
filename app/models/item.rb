class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_detaios, dependent: :destroy

  def get_image
    image
  end
     #税込価格
  def with_tax_price
    (price * 1.1).floor
  end
end
