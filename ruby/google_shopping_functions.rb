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
def getItems (item_data)
	item_data[:items]
end

def getItemsByBrand(itemArray,brand)
	output = []
	itemArray.each do |item|
		if item[:product][:brand] == brand
		output.push(item)
		end
	end
	return output
end

def getItemsByAuthor(itemArray,author)
	output = []
	itemArray.each do |item|
		if item[:product][:author][:name].include? author
			output.push(item)		
		end
	end
	return output
end

def getAvailableProducts(itemArray)
	output = []
	itemArray.each do |item|
		if item[:product][:inventories][0][:availability] == "inStock"
			output.push(item)		
		end
	end
	return output	
end

def getNames(array)
	output = []
	array.each do |item|
		output.push(item[:product][:title])		
	end	
	return output
end

# output item count using the getItemsCount function
puts "Item Count: #{get_items_count( data )}"
sonyItems = getItemsByBrand(getItems(data),"Sony")
puts "All items made by Sony:"
puts getNames(sonyItems)
puts "All items made by Sony that are available"
puts getNames(getAvailableProducts(sonyItems))
puts "All available items by author 'Adorama Camera'"
puts getNames(getItemsByAuthor(getItems(data),"Adorama Camera"))
puts "All items made by Nikon with the author eBay"
nikonItems = getItemsByBrand(getItems(data),"Nikon")
puts getNames(getItemsByAuthor(nikonItems,"eBay"))

