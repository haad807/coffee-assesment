class Order
	class DiscountChecker
		attr_reader :order

		def initialize(order)
			@order = order
		end

		def discount_amount
			if item_free?
				coffee_amount
			elsif apply_discount?
				ten_percent
			else
				0.0
			end
					
		end

		private

		def item_free?
			coffee_in_bulk?
		end

		def apply_discount?
			(sandwich_ordered? && brownie_ordered?) || coffee_ordered?
		end

		def coffee_amount
			Item.find_by(name: "coffee").amount
		end

		def coffee_in_bulk?
			order_items.map{|item| item.item_name.downcase == "coffee" && item.quantity >2 }.any?
		end

		def order_items
			@order_items ||= order.order_items
		end

		def sandwich_ordered?
			order_items.map{|item| item.item_name.downcase == "sandwich"}.any?
		end

		def coffee_ordered?
			order_items.map{|item| item.item_name.downcase == "coffee" }.any?
		end

		def brownie_ordered?
			order_items.map{|item| item.item_name.downcase == "brownie"}.any?
		end

		def ten_percent
			(order_items.inject(0){|sum, item|  sum+= item.quantity * item.amount} * 10) / 100
		end
	end
end