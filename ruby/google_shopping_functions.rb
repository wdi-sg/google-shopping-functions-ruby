require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

# display all the data
# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )

  item_data.size
end

# use byebug to set a breakpoint
#byebug
# puts "Item Count: #{get_items_count( data )}"


def getItems ( objectData )

	objectData[:items]
end

# puts "Items: #{getItems( data )}"


def getItemsByBrand(items, brand)

	result = items.find_all { |item| item[:product][:brand].downcase == brand.downcase }
end

# puts "Items by Brand: "
# pp getItemsByBrand(getItems(data), 'Sony')

def getItemsByAuthor(items, author)

	items.select { |item| item[:product][:author][:name].downcase.include?(author.downcase)}
end

# puts "Items by Author: "
# pp getItemsByAuthor(getItems(data), "Adorama Camera")


def getAvailableProducts(items)

	result = items.select do |item|
    
    item[:product][:inventories][0][:availability] == "inStock"
  end
end

# puts "Items by Availability: "
# pp getAvailableProducts(getItems(data))



# pp getItemsByBrand(getItems(data), "Sony")

# pp getItemsByBrand(getAvailableProducts(getItems(data)), "Sony")

# pp getItemsByAuthor(getAvailableProducts(getItems(data)), "Adorama Camera") # no available "Adorama Camera" products

# pp getItemsByAuthor(getItemsByBrand(getItems(data), "Nikon"), "eBay")



