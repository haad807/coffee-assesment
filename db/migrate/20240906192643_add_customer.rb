class AddCustomer < ActiveRecord::Migration[6.0]
  def up
    create_table :customers do |t|
      t.string  :name, null: false
      t.string  :email, null: false
      t.references :coffee_shop, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :customers
  end
end
