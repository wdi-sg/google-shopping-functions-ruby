require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
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

#Qn 1
def get_items (items_data)
  items_data[:items]
end

#Qn 2
def get_items_by_brand (items_data, brand)
  things = items_data[:items].select {|item| item[:product][:brand] == brand}
  things.map {|item2| item2[:product][:title]}
end

#Qn 3
def get_items_by_author (items_data, author)
  things = items_data[:items].select {|item| item[:product][:author][:name] == author}
  things.map {|item2| item2[:product][:title]}
end

#Qn 4
def get_available_products (items_data)
  things = items_data[:items].select {|item| item[:product][:inventories][0][:availability] == "inStock"}
  things.map {|item2| item2[:product][:title]}
end

# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"
# puts "Items Array: #{get_items(data)}"
# puts "Brand Items: #{get_items_by_brand(data, 'Sony')}"
# puts "Items by Author: #{get_items_by_author(data, 'Ritz Camera')}"
# puts "Items in Stock: #{get_available_products(data)}"

puts "Items made by Sony: #{get_items_by_brand(data, 'Sony')}"
def available_items_brand (items_data, brand)
  things = items_data[:items].select {|item| item[:product][:inventories][0][:availability] == "inStock" && item[:product][:brand] == brand}
  things.map {|item2| item2[:product][:title]}
end
puts "Available Items by Sony: #{available_items_brand(data, 'Sony')}"

def available_items_author (items_data, author)
  things = items_data[:items].select {|item| item[:product][:inventories][0][:availability] == "inStock" && item[:product][:author][:name] == author}
  things.map {|item2| item2[:product][:title]}
end
puts "Available Items by Adorama: #{available_items_author(data, 'Adorama Camera')}"

def items_by_brand_author (items_data, brand, author)
  things = items_data[:items].select {|item| item[:product][:brand] == brand && item[:product][:author][:name] == author}
  things.map {|item2| item2[:product][:title]}
end

puts "Items made by Nikon with author eBay: #{items_by_brand_author(data, 'Nikon', 'eBay')}"