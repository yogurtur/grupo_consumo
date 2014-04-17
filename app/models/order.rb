class Order < ActiveRecord::Base
  has_many :line_items
  has_many :products, through: :line_items
  accepts_nested_attributes_for :line_items, :allow_destroy => true, :reject_if => lambda { |a| a[:product_id].blank? or a[:quantity].blank? }
  
  validates :order_status, :payment_method, :shipping_address, :shipping_city, :customer_name, :customer_lastname, presence: true
  PAYMENTS = [ "Cash", "Credit card", "Paypal" ]
  STATUS = ["Pending", "Send", "Received"]
  
  before_validation :set_status, on: :create
      
  validates :payment_method, inclusion: PAYMENTS
  validates :order_status, inclusion: STATUS

  private
  def set_status
    self.order_status = "Pending"
  end 
end
