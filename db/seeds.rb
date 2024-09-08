puts "\e[33mcreating coffee shop"
CoffeeShop.create!(name: 'Testing Coffee House', address: "Time Square")
puts "\e[32mcoffee shop created"

puts "\e[33mcreating customer"
Customer.create!(name: 'Testing user', email: 'test@hello.com', coffee_shop: CoffeeShop.last)
puts "\e[32mcreating customer"


puts "\e[33mcreating items"
Item.create!(name: "coffee", amount: "2.50", coffee_shop: CoffeeShop.last, available: true)
Item.create!(name: "sandwich", amount: "5.50", coffee_shop: CoffeeShop.last, available: true)
Item.create!(name: "brownie", amount: "4.50", coffee_shop: CoffeeShop.last, available: true)
puts "\e[32mcreating items"


puts "\e[31madding curl command to run"
	
curl -X POST http://localhost:3000/orders \
-H "Content-Type: application/json" \
-d '{
  "order": {
    "customer_id": "1",
    "coffee_shop_id": "1",
    "order_items_attributes": [
      {"item_id": "1", "quantity": "3", "amount": "5.0", "item_name": "coffee"},
      {"item_id": "2", "quantity": "2", "amount": "3.0", "item_name": "brownie"}
    ]
  }
}'