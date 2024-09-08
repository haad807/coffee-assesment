class OrderMailer < ApplicationMailer

  def order_ready(customer, order)
    @order_items = order.order_items
    @customer_name = customer.name

    mail(to: customer.email, subject: "Order Ready")
  end
end
