class AddOrders < ActiveRecord::Migration[6.0]
  def up
    create_table :orders do |t|
      t.float :total_amount
      t.integer  :discount_rate
      t.boolean :free, default: false
      t.boolean :ready, default: false
      t.integer :status
      t.references :customer, foreign_key: true
      t.references :coffee_shop, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
