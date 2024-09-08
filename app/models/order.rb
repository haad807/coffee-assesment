class Order < ApplicationRecord

	belongs_to :coffee_shop, class_name: 'CoffeeShop', foreign_key: 'coffee_shop_id'
	belongs_to :customer

	has_many :order_items
	has_many :items, through: :order_items

	enum status: { preparing: 0, ready: 1 }, _prefix: :status

	accepts_nested_attributes_for :order_items

	after_commit :enqueue_order, on: :create

	def enqueue_order
		OrderReadyJob.set(wait_until: 15.minutes).perform_later(customer_id, id)
	end
end