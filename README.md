# README

- Clone the repo
- Run seeds file i.e rails db:seed
- Run the curl command on terminal
  curl -X POST http://localhost:3000/orders \
 -H "Content-Type: application/json" \
 -d '{
   "order": {
     "customer_id": "1",
     "coffee_shop_id": "1",
     "order_items_attributes": [
       {"item_id": "1", "quantity": "3", "amount": "5.0", "item_name": "coffee"},
       {"item_id": "2", "quantity": "2", "amount": "3.0", "item_name": "sandwich"}
     ]
   }
 }'
