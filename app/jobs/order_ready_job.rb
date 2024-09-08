class OrderReadyJob < ApplicationJob
  include Sidekiq::Worker

  queue_as :default

  def perform(customer_id, order_id)
  	customer = Customer.find_by(id: customer_id)
  	order = Order.find_by(id: order_id)

  	OrderMailer.order_ready(customer, order).deliver_now
  end
end
