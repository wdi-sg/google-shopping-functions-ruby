require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

pp data #pretty print, whatever that means; I dont get it.

#Test Ruby works
puts "Ruby Works!!!!!"

#byebug
# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count data
  data.size
end

##1 Returns an array of items
def getItems data
  data[:items]
end

##2 Returns an array of items by brand
def getItemsByBrand items, brand
  result = items.select do
    |i| i[:product][:brand] == brand
  end
  result
  # Another way of writing this would be:
  # result = items.select {|i| i[:product][:brand] == brand}
end

##3 Returns an array of items by author
def getItemsByAuthor items, author
  return items.select do
    |i| i[:product][:author][:name] == author
  end
  # Oh wow, there are so many styles
  # return items.select {|i| i[:product][:author][:name] == author}

  ### Can't seem to find authors with name eBay
  ### No way out with 'includes?'
end

##4 Returns an array of available items
def getAvailableProducts items
  return items.select do
    |i| i[:product][:inventories][0][:availability] == "inStock"
  end

  # Similarly (I can't decide which styles I prefer)
  #return items.select {|i| i[:product][:inventories][0][:availability] == "inStock"}
end

##5 Use functions
# All items made by Sony
puts "Sony Items: #{getItemsByBrand( getItems(data), 'Sony' )}"
# All items made by Sony that are available
puts "Available Sony Items: #{getAvailableProducts( getItemsByBrand( getItems(data), 'Sony' ) )}"
# All items made by author "Adorama Camera"
puts "Items by Adorama: #{getItemsByAuthor( getItems(data), 'Adorama Camera' )}"
# All items made by Nikon with author eBay
puts "Items by Nikon and eBay: #{getItemsByBrand( getItemsByAuthor( getItems(data), 'eBay' ), 'Nikon') }"


### Define and use your functions here

# output item count using the getItemsCount function
#puts "Item Count: #{get_items_count( data )}"
#puts "Item Array: #{getItems( data )}"
#puts "Item By Brand: #{getItemsByBrand( getItems(data), 'Canon' )}"
#puts "Item By Author: #{getItemsByAuthor( getItems(data), 'eBay' )}"
#puts "Item By Availability: #{getAvailableProducts( getItems(data) )}"
