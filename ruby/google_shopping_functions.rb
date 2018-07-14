require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array


def getItems data
	items = data[:items]
	result = items.map { |item| item[:product][:title] }
	return result
end

items = data[:items]


def getItemsByBrand items, brand
	results = Array.new
	items.each do |item|
		if item[:product][:brand] == brand
			results.push(item)
		end
	end
	return results
end


def getItemsByAuthor items, author
	results = Array.new
	items.each do |item|
		if item[:product][:author][:name] == author
			results.push(item)
		end
	end
	return results
end


def getAvailableProducts items 
	results = Array.new
	items.each do |item|
		if item[:product][:inventories][0][:availability] == "inStock"
			results.push(item)
		end
	end
	return results
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function

# puts "Items: #{getItems( data )}"

# puts "Sony items: #{getItemsByBrand(items, 'Sony')}"
# puts "Canon items: #{getItemsByBrand(items, 'Canon')}"
# puts "Nikon items: #{getItemsByBrand(items, 'Nikon')}"
# puts "Panasonic items: #{getItemsByBrand(items, 'Panasonic')}"

# puts "Items by author Target: #{getItemsByAuthor(items, "Target")}"
# puts "Items by author CDW: #{getItemsByAuthor(items, "CDW")}"
# puts "Items by author eBay: #{getItemsByAuthor(items, "eBay")}"

# puts "Available items: #{getAvailableProducts(items)}"





# puts "1. Sony items: #{getItemsByBrand(items, 'Sony')}"
# puts "2. Available Sony items: #{getItemsByBrand(getAvailableProducts(items), 'Sony')}"
# puts "3. Available items by author Adorama Camera: #{getItemsByAuthor(getAvailableProducts(items), 'Adorama Camera')}
# puts "4. Nikon items by author eBay: #{getItemsByAuthor(getItemsByBrand(items, 'Nikon'), 'eBay')}





# puts "All products are from US?: #{items.all? {|item| item[:product][:country] == 'US'}}"
# puts "All products are new?: #{items.all? {|item| item[:product][:condition] == 'new'}}"

# puts "Any Lytro product?: #{items.any? {|item| item[:product][:brand] == 'Lytro'}}"

items.each_with_index { |val, index| puts "#{index}. #{val[:product][:title]}" }








