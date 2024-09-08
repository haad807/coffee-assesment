class Customer < ApplicationRecord
	belongs_to :coffee_shop
	has_many :orders
end