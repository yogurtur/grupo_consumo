class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :product, index: true
      t.references :order, index: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
