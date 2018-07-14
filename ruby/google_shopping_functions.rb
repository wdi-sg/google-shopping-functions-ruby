require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count(item_data) 

  item_data.size
end


# use byebug to set a breakpoint
#byebug

# Define and use your functions here
def getItems(item_data)
  item_data[:items]
end

def getItemsByBrand(items, brand)
  items.select{|x| x[:product][:brand] == brand}

end

def getItemsByAuthor(items, author)
  items.select{|x| x[:product][:author][:name].index(author)}
end

def getAvailableProducts(items)
  items.select{|x| x[:product][:inventories][0][:availability] == "inStock"}
end

# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count (data)}"
# puts "Items: #{getItems (data)}"
# puts "Items by Brand: #{getItemsByBrand(getItems(data), "Sony")}"
# puts "Items by Author: #{getItemsByAuthor(getItems(data), "eBay")}"
# puts "Items by availability: #{getAvailableProducts(getItems(data))}"
# puts "Items by Sony that are available: #{getItemsByBrand(getAvailableProducts(getItems(data)), "Sony")}"
# puts "Items by the author 'Adorama Camera' that are available: #{getItemsByAuthor(getAvailableProducts(getItems(data)), "Adorama Camera")}"
# puts "items by Nikon with the author eBay: #{getItemsByAuthor(getItemsByBrand(getItems(data), "Nikon"),"eBay")}"