class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items

    scope :by_category, ->(category) {where("product_category like ?", category)}
    scope :by_quantity, ->(quantity) { where("quantity >= ?", quantity) if quantity.present?}
    scope :by_admission_at, ->(admission_at) { where("admission_at like ?","%#{admission_at}%") if admission_at.present?}
    scope :by_manufacturer, ->(manufacturer) { where("manufacturer like ?", manufacturer) if manufacturer.present?}
  scope :by_minimum_price, ->(minprice) { where("price >= ?", minprice) if minprice.present?}
  scope :by_maximum_price, ->(maxprice) { where("price <= ?", maxprice) if maxprice.present? }
  
  validates :name, :admission_at, :quantity, :price, presence: true
  validates :name, uniqueness: true
  validates :quantity, :price, numericality: true
  CATEGORY = ["books", "house", "music & films", "electronics", "games", "clothes", "food"]
  validates :product_category, inclusion: CATEGORY, allow_nil: true
  
    def discount_quantity(num)
	  self.quantity -= num
    update_column(:quantity, self.quantity)
    end
    
end
