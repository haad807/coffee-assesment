class OrdersController < ApplicationController
	# skip_before_action :authenticate_user!
	skip_before_action :verify_authenticity_token

	def index
		@items = Order.all
	end

	def create
		::Order::GenerateOrder.new(permitted_params).generate_order
	end

	private

	def permitted_params
		params.require(:order).permit(
			:coffee_shop_id,
			:customer_id,
			order_items_attributes: %i[item_id quantity amount item_name]
		)
	end
end
