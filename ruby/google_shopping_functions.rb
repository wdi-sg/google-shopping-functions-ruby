require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  item_data.size
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"

def get_items(data)
  data[:items]
end

# puts "item array: #{get_items( data )}"

items = get_items(data)
# puts items

def get_items_by_brand(items, brand)
  brand.downcase!
  items.select { |item| item[:product][:brand].downcase.include? brand }
end

def get_items_by_author(items, author)
  author.downcase!
  items.select { |item| item[:product][:author][:name].downcase.include? author }
end

def get_available_products(items)
  items.select { |item| item[:product][:inventories][0][:availability] == "inStock" }
end

# pp get_items_by_brand(items, "sony")
# pp get_items_by_author(items, "ebay")
# pp get_available_products(items)

# All items made by Sony that are available.
pp get_available_products(get_items_by_brand(items, "sony"))

# All available items by the author "Adorama Camera"
pp get_available_products(get_items_by_author(items, "Adorama Camera"))

# All items made by Nikon with the author eBay.
pp get_items_by_author(get_items_by_brand(items, "Nikon"), "ebay")
