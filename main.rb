# main.rb
require_relative 'item'
require_relative 'cart'

url = 'http://books.toscrape.com'
items = Item.from_url(url)

cart = Cart.new

items.each do |item|
  cart.add_to_cart(item)
end

cart.save_to_file('cart.txt')
cart.save_to_json('cart.json')
cart.save_to_csv('cart.csv')
