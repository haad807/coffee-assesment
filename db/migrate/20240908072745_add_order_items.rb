class AddOrderItems < ActiveRecord::Migration[6.0]
  def up
    create_table :order_items do |t|
      t.integer  :quantity, null: false
      t.references :item, null: false
      t.references :order, foreign_key: true
      t.float :amount
      t.string :item_name


      t.timestamps
    end
  end

  def down
    drop_table :order_items
  end
end
