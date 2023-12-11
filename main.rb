require_relative 'item'
require_relative 'cart'
require_relative 'parser'

url = 'http://books.toscrape.com'
items = Item.from_url(url)

cart = Cart.new

settings = { max_price: 50.0 }

items.each do |item|
  parsed_item = Parser.parse_item(item, settings)
  cart.add_to_cart(parsed_item) if parsed_item
end


cart.total_price


cart.save_to_file('cart.txt')
cart.save_to_json('cart.json')
cart.save_to_csv('cart.csv')