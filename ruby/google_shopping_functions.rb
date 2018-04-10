require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

#pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )

  item_data.size
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here
# 1.) getItems(objectData)
def get_items(item_data)
  item_data[:items]
end

# 2.) getItemsByBrand(items, brand)
def get_items_by_brand(items, brand)
  puts items
    items.select{|item| item[:product][:brand].downcase == brand.downcase}
end

# 3.) getItemsByAuthor(items, author)
def get_items_by_author(items, author)
  items.select{|item| item[:product][:author][:name].downcase == author.downcase}
end

# 4.) getAvailableProducts(items)
def get_available_products(items)
  items.select{|item| item[:product][:inventories][0][:availability] == 'inStock'}
end

# 5.) Use your functions

# All items made by Sony.
pp get_items_by_brand(get_items(data), 'Sony')

# All items made by Sony that are available.
pp get_available_products(get_items_by_brand(get_items(data), 'Sony'))

# All available items by the author "Adorama Camera"
pp get_available_products(get_items_by_author(get_items(data), 'Adorama Camera'))

# All items made by Nikon with the author eBay.
pp get_items_by_author(get_items_by_brand(get_items(data), 'Nikon'), 'eBay')

# output item count using the getItemsCount function
puts "Item Count: #{get_items_count( data )}"

