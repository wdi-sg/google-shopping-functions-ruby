require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

#pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  item_data.size
end

#Objective 1
def get_items( object_data ) 
	return object_data[:items]
end

#Objective 2
# def get_items_by_brand( items, brand )
# 	foo = items.select do |item|
#  	 	item[:product][:brand] == brand		
# 	end
# 	return foo
# end

# #Objective 2 - Shorten
# def get_items_by_brand( items, brand )
# 	items.select do |item|
#  	 	item[:product][:brand] == brand		
# 	end
# end

#Objective 2 - OMG it could be shorter!!
def get_items_by_brand( items, brand )
	items.select { |item| item[:product][:brand].downcase == brand.downcase }
end

#To call
#puts get_items_by_brand( get_items(data), "Canon" )

#Objective 3
def get_items_by_author( items, author )
	items.select { |item| item[:product][:author][:name].downcase.include? (author.downcase)}
end

#Objective 4
def get_available_products( items )
	items.select { |item| item[:product][:inventories][0][:availability] == "inStock"}	
end

#Objective 5
pp get_items_by_brand( get_items(data), "Sony" )

pp get_items_by_brand( get_available_products( get_items( data ) ), "Sony" )

pp get_items_by_author( get_items(data), "Adorama Camera" )

pp get_items_by_author( get_items_by_brand( get_items( data ), 'Nikon' ), 'eBay' ) 

#To call
#pp get_items_by_author( get_items(data), "eBAY" )

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function
puts "Item Count: #{get_items_count( data )}"
