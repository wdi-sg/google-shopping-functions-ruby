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

  item_data.size
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# 1)
def getItems(item_data) 
  item_data[:items]
end

# 2)
def getItemsByBrand(items, brand)
  items.select{|x| x[:product][:brand] == brand}

end

# 3)
def getItemsByAuthor(items, author)
  items.select{|x| x[:product][:author][:name].include?(author)}
end

# 4)
def getAvailableProducts(items)
  items.select{|x| x[:product][:inventories][0][:availability] == "inStock"}
end


# output item count using the getItemsCount function

puts "Item Count: #{get_items_count( data )}"

# 1)
puts "All items made by Sony: #{ getItemsByBrand( getItems(data),'Sony' ) }"

# 2)
puts "All items made by Sony that are avaiable: #{ getAvailableProducts( getItemsByBrand( getItems(data), 'Sony' ))}"

# 3)
puts "All available items by author 'Adorama Camera': #{getAvailableProducts(getItemsByAuthor(getItems(data), 'Adorma Camera'))}"

# 4)
puts "All items made by Nikon with the author eBay: #{getItemsByAuthor(getItemsByBrand(getItems(data), 'Nikon'), 'eBay')}"


# pp data[:items].map{|x| x[:product][:author][:name]}

