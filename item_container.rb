#item_container.rb
module ItemContainer
    def add_to_cart(item)
      @items << item
      puts "Item added to cart: #{item.to_s}"
    end
  
    def remove_from_cart(item)
      @items.delete(item)
      puts "Item removed from cart: #{item.to_s}"
    end
  
    def view_cart
      puts "Items in the cart:"
      @items.each { |item| puts item.to_s }
    end
  
    def total_price
        total = @items.inject(0) { |sum, item| sum + item.price.delete('£').to_f } #без цього буде помилка з змінними і покаже що корзина = 0
        puts "Total Price: £#{total}"
    end
  end
  