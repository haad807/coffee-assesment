class AddItem < ActiveRecord::Migration[6.0]
  def up
    create_table :items do |t|
      t.string  :name, null: false
      t.float  :amount, null: false
      t.boolean :available, default: false
      t.string :category
      t.references :coffee_shop, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :items
  end
end
