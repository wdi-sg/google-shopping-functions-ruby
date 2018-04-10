require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

# def get_items_count( item_data )

#   item_data.size
# end

# # use byebug to set a breakpoint
# #byebug

# # Define and use your functions here

# # output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"

# 1. Create a function called getItems that simply returns the items array from the google product object.
def get_items(item_data)
	return item_data[:items]
end
# puts "Item: #{get_items(data)}"

# 2. Create a function called getItemsByBrand that takes an item array returns a new array of all items of a specified brand.
# Test this function by searching for Sony, Canon, Nikon and Panasonic.
def get_Items_By_Brand(items, brand)
	brand_items = []
	items.each do |item|
		if item[:product][:brand] == "Sony"
			brand_items.push(item)
		end	
	end
	return brand_items
end	
pp get_Items_By_Brand(get_items(data), "Sony")

# 3. Create a function called getItemsByAuthor that takes an item array and returns a new array of all items by a specified author.
def get_Items_By_Author(items, author)
	author_items = []
	items.each do |item|
		if item[:product][:author][:name] == "Target"
			author_items.push(item)
		end
	end
	return author_items
end
pp get_Items_By_Author(get_items(data), "Target")

# 4. Create function called getAvailableProducts that takes an item array and returns an array containing all of the available products 
#    (an available product is one with at least one availability of "inStock" in the inventories array)
def get_Available_Products(items, available)
	available_items = []
	items.each do |item|
		if item[:product][:inventories][0][:availability] = "inStock"
			available_items.push(item)
		end
	end
	return available_items
end
pp get_Available_Products(get_items(data), "inStock")

# 5. Use the functions you created in 1 - 4 to ouput (puts) the following lists of items.
# All items made by Sony.
# All items made by Sony that are available.
# All available items by the author "Adorama Camera"
# All items made by Nikon with the author eBay.
pp get_Items_By_Brand(get_Items_By_Author(data), "Nikon"), "eBay")