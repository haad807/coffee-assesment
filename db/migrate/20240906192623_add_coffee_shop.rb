class AddCoffeeShop < ActiveRecord::Migration[6.0]
  def up
  	create_table :coffee_shops do |t|
      t.string	:name, null: false
      t.string	:address, null: false

      t.timestamps
    end
  end

  def down
    drop_table :coffee_shops
  end
end
