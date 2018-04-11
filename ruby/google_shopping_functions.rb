require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  item_data[:items].size
end

# Create a function called getItems that simply returns the items array from the google product object.
def get_items(object_data)
  object_data[:items]
end

# Create a function called getItemsByBrand that takes an item array returns a new array of all items of a specified brand.
def getItemsByBrand(item_array, brand)
  item_array.select do |item|
    item[:product][:brand].include?(brand)
  end
end

# Create a function called getItemsByAuthor that takes an item array and returns a new array of all items by a specified author.
def getItemsByAuthor(item_array, author)
  item_array.select do |item|
    item[:product][:author][:name] == author
  end
end

# Create function called getAvailableProducts that takes an item array and returns an array containing all of the available products (an available product is one with at least one availability of "inStock" in the inventories array)
def getAvailableProducts(item_array)
  available_products = []
  item_array.select do |item|
    available_products.push(item[:product]) if item[:product][:inventories][0][:availability].include?("inStock")
  end
end


# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"
# puts
# puts "Item array: #{get_items(data)}"
# puts
# puts "Sony Items: #{getItemsByBrand(get_items(data), "Sony")}"
# puts
# puts "Target items: #{getItemsByAuthor(get_items(data), "Target")}"
puts "available: #{getAvailableProducts(get_items(data))}"
