require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

def get_items_count( item_data )
  item_data.size
end

def get_items ( item_data )
  item_data[:items]
end

def get_brands (items, brand)
  result = items.select { |i| i[:product][:brand] == brand }
end

def get_author (items, author)
  result = items.select { |i| i[:product][:author][:name] == author }
end

def available_products (items)
  result = items.select { |i| i[:product][:inventories][0][:availability] == "inStock"}
end

# Define and use your functions here
puts "First Q: #{get_brands(get_items(data), 'Sony')}"
puts "Second Q: #{available_products( get_brands(get_items(data), 'Sony') )}"
puts "Third Q: #{available_products( get_author(get_items(data), 'Adorama Camera') )}"
puts "Fourth Q: #{get_author( get_brands(get_items(data), 'Nikon'), 'eBay' )}"
