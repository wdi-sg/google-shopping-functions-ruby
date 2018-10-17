# require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
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
def getItems(item_data)
  item_data[:items]
end

def getItemsByBrand(items, brandname)
   items.select { |item| item[:product][:brand] == brandname}
end

def getItemsByAuthor(items, authorname)
   items.select { |item| item[:product][:author][:name] == authorname}
end

def getAvailableProducts(items)
   items.select { |item| item[:product][:inventories][0][:availability] == 'inStock'}
end

# output item count using the getItemsCount function

#puts "Item Count: #{get_items_count( data )}"
#puts "Item List: #{getItems( data )}"
#puts "Item By Brand: #{getItemsByBrand( getItems( data ), 'Sony' ) }"
#puts "Item By Author: #{getItemsByAuthor( getItems( data ), 'eBay' ) }"
#puts "Available Products: #{getAvailableProducts( getItems( data )) }"
#puts "All items made by sony: #{getItemsByBrand( getItems( data ), 'Sony' ) }"
#puts "All items made by sony that are available: #{getItemsByBrand( getAvailableProducts( getItems( data )) , 'Sony' )}"
#puts "All available items by the author Adorama Camera: #{ getItemsByAuthor(getAvailableProducts( getItems( data )), 'Adorama Camera') }"
puts "All items made by Nikon with the author eBay: #{ getItemsByBrand( getItemsByAuthor( getItems( data ), 'eBay' ), 'Nikon' ) }"
