require 'byebug'
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

# output item count using the getItemsCount function
puts "Item Count: #{get_items_count( data )}"


# 1. Create a function called `getItems` that simply returns the items array from the google product object.
def get_items ( item_data )
  item_data[:items]
end


# 2. Create a function called `getItemsByBrand` that takes an item array returns a new array of all items of a specified brand.
def get_items_by_brand (item_data)
  item_data[:items,[product][brand]]
end


# 3. Create a function called `getItemsByAuthor` that takes an item array and returns a new array of all items by a specified author.
def get_items_by_author (item_data)
  item_data
end


# 4. Create function called `getAvailableProducts` that takes an item array and returns an array containing all of the available products (an available product is one with at least one availability of "inStock" in the inventories array)
def get_available_products (item_data)
  item_data
end


# Use the functions you created in 1 - 4 to ouput (`puts`) the following lists of items.

# * All items made by Sony.
puts "Items made by Sony: #{get_items_by_brand, 'Sony'}"
# * All items made by Sony that are available.
puts "Sony Items Available: #{get_available_products, 'Sony'}"
# * All available items by the author "Adorama Camera"
puts "Adorama Camera's Items: #{get_items_by_author, 'Adorama Camera'}"
# * All items made by Nikon with the author eBay.
puts "All Nikon Items on eBay: #{get_items_by_author, 'eBay' && get_items_by_brand, 'Nikon'}"