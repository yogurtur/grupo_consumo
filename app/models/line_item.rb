class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  before_validation :set_product_price
  after_create :discount_quantity
  
  validates :product_id, :quantity, :price, presence: true
  validates :quantity, :price, numericality: true
  
  def line_item_price
    total = quantity * product.price
  end
  
  private
  def set_product_price
    self.price = product.price
  end
  
  def discount_quantity
      product.discount_quantity(quantity)
  end
end
