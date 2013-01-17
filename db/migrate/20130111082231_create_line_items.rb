class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
