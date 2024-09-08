CoffeeShop.create!(name: 'Testing Coffee House', address: "Time Square")

Customer.create!(name: 'Testing user', email: 'test@hello.com', coffee_shop: CoffeeShop.last)

Item.create!(name: "coffee", amount: "2.50", coffee_shop: CoffeeShop.last, available: true)
Item.create!(name: "sandwich", amount: "5.50", coffee_shop: CoffeeShop.last, available: true)
Item.create!(name: "brownie", amount: "4.50", coffee_shop: CoffeeShop.last, available: true)