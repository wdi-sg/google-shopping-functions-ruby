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
def get_items( objectData )
	objectData[:items]
end

def get_items_by_brand(items, brand)
	items.select{|item| item[:product][:brand] == brand}
end

def get_items_by_author(items, author)
	items.select{|item| item[:product][:author][:name].include? author}
end

def get_available_products(items)
	items.select{|item| item[:product][:inventories][0][:availability] == "inStock"}
end
# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"
# puts "Items by Brand Sony: #{get_items_by_brand( get_items(data), 'Sony' )}"
# puts "Items by Brand Canon: #{get_items_by_brand( get_items(data), 'Canon' )}"
# puts "Items by Brand Nikon: #{get_items_by_brand( get_items(data), 'Nikon' )}"
# puts "Items by Brand Panasonic: #{get_items_by_brand( get_items(data), 'Panasonic' )}"
# puts "Items by author Target: #{get_items_by_author( get_items(data), 'Target')}"
# puts "Items by author CDW: #{get_items_by_author( get_items(data), 'CDW')}"
# puts "Items by author eBay: #{get_items_by_author( get_items(data), 'eBay')}"
# puts "Items that are available: #{get_available_products( get_items(data) )}"
# puts "Items made by Sony: #{get_items_by_brand( get_items(data), 'Sony' )}"
# puts "Items made by Sony that are available: #{get_items_by_brand( get_available_products(getItems(data)), 'Sony' )}"
# puts "Items by author Adorama Camera that are available: #{get_items_by_author( get_available_products(getItems(data)), 'Adorama Camera' )}"
# puts "Items made by Nikon with the author eBay: #{get_items_by_brand( get_items_by_author(get_items(data), 'eBay'), 'Nikon')}"
