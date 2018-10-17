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

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"

def getItems (get_item)
  get_item[:items]
end
# puts "ITEM: #{getItems(data)}"
# pp getItems(data)

def getItemsByBrand (items, brand)
  result = items.select{|x| x[:product][:brand] == brand}
end

def getItemsByAuthor (items, author)
  result = items.select{|x| x[:product][:brand][:name] == author}
end

def getAvailableProducts (items)
  result = items.select {|x| x[:product][:inventories][0][:availability] == "inStock"}
end

# puts "Q1:  #{getItemsByBrand(getItems(data), 'Sony')}"
# pp Q1: getItemsByBrand(getItems(data), 'Sony')

# puts "Q2: #{getAvailableProducts(getItemsByBrand(getItems(data), 'Sony'))}"
# pp Q2: getAvailableProducts(getItemsByBrand(getItems(data), 'Sony'))

# puts "Q3: #{getAvailableProducts(getItemsByAuthor(getItems(data), 'Adorama Camera'))}"
# pp Q3: getAvailableProducts(getItemsByAuthor(getItems(data), 'Adorama Camera'))

puts "Q4 #{getItemsByAuthor(getItemsByBrand(getItems(data),'Nikon'), 'eBay')}"
# pp Q4: getItemsByAuthor(getItemsByBrand(getItems(data),'Nikon'), 'eBay')