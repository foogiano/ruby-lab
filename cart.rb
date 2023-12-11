require_relative 'item_container'

class Cart
  include ItemContainer

  attr_accessor :items

  def initialize
    @items = []
  end

  def save_to_file(filename)
    create_output_folder
    file_path = File.join('output', filename)
    
    File.open(file_path, 'w') do |file|
      @items.each { |item| file.puts item.to_h }
    end

    puts "Cart information saved to #{file_path}"
  end

  def save_to_json(filename)
    create_output_folder
    file_path = File.join('output', filename)

    require 'json'
    json_data = @items.map(&:to_h).to_json
    File.write(file_path, json_data)

    puts "Cart information saved to #{file_path}"
  end

  def save_to_csv(filename)
    create_output_folder
    file_path = File.join('output', filename)

    require 'csv'
    CSV.open(file_path, 'w') do |csv|
      csv << %w[title author price published_date category]
      @items.each { |item| csv << item.to_h.values }
    end

    puts "Cart information saved to #{file_path}"
  end

  private

  def create_output_folder
    Dir.mkdir('output') unless Dir.exist?('output')
  end
end
