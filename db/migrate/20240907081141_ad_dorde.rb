class AdDorde < ActiveRecord::Migration[6.0]
  def change
  	add_column :coffee_shops, :order_id, :bigint
  	add_column :items, :order_id, :bigint
  	add_column :customers, :order_id, :bigint
  end
end
