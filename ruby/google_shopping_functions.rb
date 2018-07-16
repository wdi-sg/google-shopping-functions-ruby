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
# puts "3. Available items by author Adorama Camera: #{getItemsByAuthor(getAvailableProducts(items), 'Adorama Camera')}"
# puts "4. Nikon items by author eBay: #{getItemsByAuthor(getItemsByBrand(items, 'Nikon'), 'eBay')}"





# puts "All products are from US?: #{items.all? {|item| item[:product][:country] == 'US'}}"
# puts "All products are new?: #{items.all? {|item| item[:product][:condition] == 'new'}}"

# puts "Any Lytro product?: #{items.any? {|item| item[:product][:brand] == 'Lytro'}}"

# items.each_with_index { |val, index| puts "#{index}. #{val[:product][:title]}" }
# getItemsByBrand(items, 'Nikon').each_with_index { |item, index| puts "#{index}. #{item[:product][:title]}" }

# pentax =  items.find { |item| item[:product][:brand] == 'Pentax' }
# puts "One of the Pentax products: #{pentax[:product][:title]}"
# expItem = items.find { |item| item[:product][:inventories][0][:price] > 2000 }
# puts "One of the products above $2000: #{expItem[:product][:title]}"

=begin
++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++

NOT WORKING BELOW

++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++
=end

# all_pentax = items.find_all { |item| item[:product][:brand] == 'Pentax' }
# puts "All Pentax products: #{all_pentax}"
# all_paid_shipping = items.find_all { |item| (item[:product][:inventories][0][:shipping]).to_i > 0 }
# puts "All products with paid shipping: #{all_paid_shipping}"

# puts "Massive item index: #{items.find_index { |item| item[:product][:description].include? "Massive" }}"
# puts "Backorder item index: #{items.find_index { |item| item[:product][:inventories][0][:availability] == "backorder" }}"

# puts "Items list: #{items.map { |item| item[:product][:title] }}"
# puts "Price list: #{items.map { |item| item[:product][:inventories][0][:price] }}"

# longest = items.reduce do |item_1, item_2|
# 	item_1[:product][:title].length > item_2[:product][:title].length ? item_1 : item_2
# end
# puts "Longest title: #{longest[:product][:title]}"
# most_expensive = items.reduce do |item_1, item_2|
# 	(item_1[:product][:inventories][0][:price]).to_f > (item_2[:product][:inventories][0][:price]).to_f ? item_1 : item_2
# end
# puts "Most expensive item: #{most_expensive[:product][:title]}"

=begin
++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++

NOT WORKING BELOW

++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++
=end

# puts "Non-Nikon items: #{items.reject { |item| item[:product][:brand] == 'Nikon' }}"
# puts "Old items: #{items.reject { |item| item[:product][:condition] == "new" }}"

# puts "Nikkon items: #{items.select { |item| item[:product][:brand] == 'Nikon' }}"

# puts "Least to most expensive items: #{items.sort_by { |item| (item[:product][:inventories][0][:price]).to_f }}"

# puts "Nikon product: #{items.take_while { |item| item[:product][:brand] == 'Nikon' }}"

# puts "Unique brands: #{items.uniq { |item| item[:product][:brand] }}"


