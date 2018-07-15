require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  item_data.size
end

# puts "Item Count: #{get_items_count( data )}"


# Define and use your functions here


# 1.) getItems(objectData)

def getItems( objectData )
	objectData[:items]
end

# puts "Items: #{getItems(data)}"



## 2.) getItemsByBrand(items, brand)

def getItemsByBrand(items, brand)
	items.select{|item| item[:product][:brand] == brand}
end

# Test this function by searching for Sony, Canon, Nikon and Panasonic.
# puts "Items by brand Sony: #{getItemsByBrand( getItems(data), 'Sony' )}"
# puts "Items by brand Canon: #{getItemsByBrand( getItems(data), 'Canon' )}"
# puts "Items by brand Nikon: #{getItemsByBrand( getItems(data), 'Nikon' )}"
# puts "Items by brand Panasonic: #{getItemsByBrand( getItems(data), 'Panasonic' )}"



## 3.) getItemsByAuthor(items, author)

def getItemsByAuthor(items, author)
	items.select{|item| item[:product][:author][:name].include? author}
end

# Test this function by searching for Target, CDW, eBay
# puts "Items by author Target: #{getItemsByAuthor( getItems(data), 'Target')}"
# puts "Items by author CDW: #{getItemsByAuthor( getItems(data), 'CDW')}"
# puts "Items by author eBay: #{getItemsByAuthor( getItems(data), 'eBay')}"



## 4.) getAvailableProducts(items)

def getAvailableProducts(items)
	items.select{|item| item[:product][:inventories][0][:availability] == "inStock"}
end

# puts "Items that are available: #{getAvailableProducts( getItems(data) )}"



## 5.) Use your functions

# * All items made by Sony.
puts "Items made by Sony: #{getItemsByBrand( getItems(data), 'Sony' )}"

# * All items made by Sony that are available.
puts "Items made by Sony that are available: #{getItemsByBrand( getAvailableProducts(getItems(data)), 'Sony' )}"

# * All available items by the author "Adorama Camera"
puts "Items by author Adorama Camera that are available: #{getItemsByAuthor( getAvailableProducts(getItems(data)), 'Adorama Camera' )}"

# * All items made by Nikon with the author eBay.
puts "Items made by Nikon with the author eBay: #{getItemsByBrand( getItemsByAuthor(getItems(data), 'eBay'), 'Nikon')}"