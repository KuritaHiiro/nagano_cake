class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  def get_image(width,height)
    image
  end
end
