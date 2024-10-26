class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total_price
    total = 0
    cart_items.each do |item|
      price = item.product.price
      if item.product.code == 'GR1' && item.quantity >= 2
        price = price * (item.quantity / 2 + item.quantity % 2)
      elsif item.product.code == 'SR1' && item.quantity >= 3
        price = price * 0.9 * item.quantity
      elsif item.product.code == 'CF1' && item.quantity >= 3
        price = price * (2 / 3.0) * item.quantity
      else
        price = price * item.quantity
      end
      total += price
    end
    total.round(2)
  end
end
