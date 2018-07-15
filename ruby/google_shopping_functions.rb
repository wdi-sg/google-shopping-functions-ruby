require 'byebug'
require 'json'
require 'pp'



file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})
# puts "THIS IS ITEM AVAILABILITY : #{data[:items][0][:product][:inventories][0][:availability]}"

# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the   length of the items array

# def get_items_count( item_data )
#   item_data.size
# end

def get_items (item_data)
  item_data[:items];
end

def get_items_by_brand (itemsArray, brandNames)
  itemsArray.select { |item| item[:product][:brand] == brandNames }

end

def get_items_by_author(itemsArray, authorName)
  itemsArray.select { |item| item[:product][:author][:name] == authorName}
end

def get_items_by_availability(itemsArray)
  items_by_availability = itemsArray.select { |item| item[:product][:inventories][0][:availability] == "inStock"}.length
  # puts "AVAILABLE ITEMS: #{items_by_availability.length}"
end




# use byebug to set a breakpoint
# byebug

# Define and use your functions here

# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"
puts "Items Array #{pp get_items(data)}"
puts "Sony Items #{pp get_items_by_brand(get_items(data), "Sony")}"
puts "Canon Items #{pp get_items_by_brand(get_items(data), "Canon")}"
puts "Nikon Items #{pp get_items_by_brand(get_items(data), "Nikon")}"
puts "Panasonic Items #{pp get_items_by_brand(get_items(data), "Panasonic")}"
puts "ITEMS BY author - TARGET: #{pp get_items_by_author(get_items(data), "Target")}"
puts "Items by author - CDW: #{pp get_items_by_author(get_items(data), "CDW")}"
puts "Items by author - eBay: #{pp get_items_by_author(get_items(data), "eBay")}"
puts "Available items by Sony: #{pp get_items_by_availability(get_items_by_brand(get_items(data), "Sony"))}"
puts "Available items by Adorama Camera #{get_items_by_availability(get_items_by_author(get_items(data), "Adorama Camera"))}"
puts "Nikon items by eBay #{get_items_by_author(get_items_by_brand(get_items(data), "Nikon"), "eBay - onecall")}"
