class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  
    def line_item_price
    total = quantity * product.price
    end

end
