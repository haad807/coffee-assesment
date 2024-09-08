class CoffeeShop < ApplicationRecord
	has_many :items
	has_many :orders
	has_many :customers
end