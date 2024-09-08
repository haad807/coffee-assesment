class Order
	class GenerateOrder
		attr_accessor :params, :order

		def initialize(params)
			@params = params
		end

		def generate_order
			@order = Order.create!(
				order_items_attributes: params[:order_items_attributes],
				status: Order.statuses["preparing"],
				coffee_shop_id: params[:coffee_shop_id],
				customer_id: params[:customer_id]
			)

			order.update!(total_amount: order_amount )
		end

		def order_amount
			Order::AmountCalculator.new(order).generate_bill
		end
	end
end