# require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  item_data.size
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

def get_items( item_data )
  item_data[:items]
end

def get_brands ( items, brand )
  result = items.select { |i| i[:product][:brand] == brand }
end

def get_author ( items, author )
  result = items.select { |i| i[:product][:author][:name] == author }
end

def get_available_products (items)
  result = items.select { |i| i[:product][:inventories][0][:availability] == 'inStock' }
end

# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"
# puts "Items #{get_items( data )}"
# puts "#{get_brands(get_items(data), 'Sony')}"
# puts "#{get_author(get_items(data), 'eBay')}"


puts "1) #{get_brands(get_items(data), 'Sony')}"
puts "2) #{get_available_products(get_brands(get_items(data), 'Sony'))}"
puts "Third Q: #{get_available_products(get_author(get_items(data), 'Adorama Camera') )}"
puts "Fourth Q: #{get_author(get_brands(get_items(data), 'Nikon'), 'eBay' )}"