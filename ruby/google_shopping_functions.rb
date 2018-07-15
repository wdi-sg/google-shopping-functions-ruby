require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

# use byebug to set a breakpoint
#byebug




# Define and use your functions here

def get_items_count(item_data)
  item_data.size
end

def getItems(objData)
	item_array = objData[:items]
end

def getItemsByBrand(items, brand)
	result = items.select { |item| item[:product][:brand] == brand }
end

def getItemsByAuthor(items, author)
	result = items.select { |item| item[:product][:author][:name].include? author == author } 
end

def getAvailableProducts(items)
	result = items.select { |item| item[:product][:inventories][0][:availability] == "inStock" }
end


# output to check functions

puts "Item Count: #{ get_items_count( data )}"

puts "Items Array: #{ getItems(data)}"

puts "Items made by brand - Nikon: #{ getItemsByBrand(getItems(data), "Nikon")}"

puts "Items by author - eBay: #{ getItemsByAuthor(getItems(data), "eBay")}"

puts "Available items: #{ getAvailableProducts(getItems(data)) }"


# output for Deliverables

puts "Items made by Sony: #{ getItemsByBrand(getItems(data), "Sony")}"

puts "Available items made by Sony: #{ getItemsByBrand (getAvailableProducts(getItems(data)), "Sony") }"

puts "Available items by Adorama Camera: #{ getItemsByAuthor (getAvailableProducts(getItems(data)), "Adorama Camera") }"

puts "All items made by Nikon with author eBay: #{ getItemsByAuthor (getItemsByBrand(getItems(data)), "Nikon"), "eBay" }"



# Further

#using find_all

def getItemsByBrand(items, brand)
	result= items.find_all { |item| item[:product][:brand] == brand}
end

puts getItemsByBrand( getItems(data), "Canon")

