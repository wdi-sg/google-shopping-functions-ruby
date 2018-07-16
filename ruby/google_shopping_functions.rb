require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# outputs the whole data file
# pp data

def get_items_count( item_data )
  item_data.size
end
# puts "Item Count: #{get_items_count( data )}"



def get_items ( item_data )
	item_data[:items]
end

items = get_items( data )
# puts "Item array: #{items}"



def get_items_by_brand ( item_data, brand )
	result = Array.new
	
	item_data.each do |i|		
		if i[:product][:brand] == brand
				result.push(i[:product])
		end
	end
		puts result
end
# get_items_by_brand(items, "Adorama Camera")



def get_items_by_author ( item_data, author )
	result = Array.new
	
	item_data.each do |i|		
		if i[:product][:author][:name] == author
				result.push(i[:product])
		end
	end
		puts result
end
# get_items_by_author(items, "eBay")



def get_available_products ( item_data )
	result = Array.new
	
	item_data.each do |i|		
		if i[:product][:inventories][0][:availability] == "inStock"
				result.push(i[:product])
		end
	end
		puts result
end
# get_available_products(items)



sony = get_items_by_brand(items, "Sony")
sony_available = get_available_products(sony)
# put sony_available

nikon = get_items_by_brand(items, "Nikon")
# nikon_ebay = get_items_by_author(nikon, "eBay")
put nikon

# use byebug to set a breakpoint
# byebug
