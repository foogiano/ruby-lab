class Parser
    def self.parse_item(item, settings)
      return nil unless item && item.price
  
      item_price = item.price.delete('£').to_f
      return item if item_price < settings[:max_price].to_f
  
      return nil
    end
  end  
