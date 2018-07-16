require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def getItems data
	items = data[:items]
	result = items.map { |item| item[:product][:title] }
end


def getItemsByBrand items, brand
	results = Array.new
	items.each do |item|
		if item[:product][:brand] == brand
			results << item
		end
	end
end


def getItemsByAuthor items, author
	results = Array.new
	items.each do |item|
		if item[:product][:author][:name] == author
			results << item
		end
	end
end


def getAvailableProducts items 
	results = Array.new
	items.each do |item|
		if item[:product][:inventories][0][:availability] == "inStock"
			results << item
		end
	end
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function




