require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

#$data = data[:items]
#pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

# use byebug to set a breakpoint
#byebug

# Checking functions

def get_items( item_data )
	item_data[:items]
end

def avail_items(items)
	items.select{|i| i[:product][:inventories][0][:availability] == "inStock"}.length
end

# Operating functions

def get_items_count( items, brand )
	result =items.select{|i| i[:product][:brand] == brand}.length
end

def get_items_by_brand(items,brand)
	result = items.select{|i| i[:product][:brand] == brand}
end

def get_items_by_author(items,author)
	result = items.select{ |i| i[:product][:author][:name] == author }
end
 
# Output

puts "Number of Sony items: #{get_items_count(get_items(data), 'Sony')}"

puts "Items made by Sony: #{get_items_by_brand(get_items(data),'Sony')}"

puts "Available items made by Sony: #{avail_items(get_items_by_brand(get_items(data),'Sony'))}"

puts "By author: #{avail_items(get_items_by_author(get_items(data), 'Adorama Camera') )}"

puts "Items made by Nikon with the author eBay: #{get_items_by_author(get_items_by_brand(get_items(data), 'Nikon'), 'eBay')}"









