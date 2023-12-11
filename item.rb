# item.rb
require 'nokogiri'
require 'open-uri'

class Item
  attr_accessor :title, :author, :price, :published_date, :category

  def initialize(title, author, price, published_date, category)
    @title = title
    @author = author
    @price = price
    @published_date = published_date
    @category = category
  end

  def info(&block)
    if block_given?
      yield(self)
    else
      puts "Title: #{@title}"
      puts "Author: #{@author}"
      puts "Price: #{@price}"
      puts "Published Date: #{@published_date}"
      puts "Category: #{@category}"
    end
  end

  def to_s
    "Title: #{@title}, Author: #{@author}, Price: #{@price}, Published Date: #{@published_date}, Category: #{@category}"
  end

  def to_h
    {
      title: @title,
      author: @author,
      price: @price,
      published_date: @published_date,
      category: @category
    }
  end

  def self.from_url(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)

    items = []

    doc.css('.product_pod').each do |product_pod|
      title = product_pod.css('h3 a').text
      author = product_pod.css('.author').text
      price = product_pod.css('.price_color').text
      published_date = product_pod.css('.published').text
      category = product_pod.css('.category').text

      items << Item.new(title, author, price, published_date, category)
    end

    items
  end
end
