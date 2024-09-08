class Order
	class AmountCalculator
		attr_reader :order

		def initialize(order)
			@order = order
		end

		def generate_bill
			return total_sum unless discount_available?

			total_bill
		end

		private

		def total_bill
			total_sum - discount_amount
		end

		def total_sum
			@total_sum ||= order.order_items.inject(0){|sum, item| sum += item.quantity * item.amount}
		end

		def discount_available?
			["Monday, Wednesday, Friday"].include?(Date.today.strftime("%A"))
		end

		def discount_amount
			Order::DiscountChecker.new(order).discount_amount
		end
	end
end