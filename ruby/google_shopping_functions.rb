# require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data[:items]

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
	item_data.size
end
# puts "Item Count: #{get_items_count( data )}"

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

######################################################################################################################################################################################################################################################################################################################
#Q1
def get_items( all_items )
	all_items[:items]
end
# puts "#{get_items( data )}}"

####################################################################################################################################################################################################################################################################################################################
#Q2
def get_items_by_brand( items_data , brand )
	items_data[:items].select do |select_brand|
		select_brand[:product][:brand] == brand.capitalize
	end

end
# pp get_items_by_brand( data , "canon" )

###################################################################################################################################################################################################################################################################################################################
#Q3
def get_items_by_author( items_data , author )
	items_data[:items].select do |select_author|
		select_author[:product][:author][:name] == author
	end
end
# pp get_items_by_author(data, "CDW")

###################################################################################################################################################################################################################################################################################################################
#Q4
def get_available_products(items_data)
	items_data[:items].select do |select_available|
		select_available[:product][:inventories][0][:availability] == "inStock"
	end
end
# pp get_available_products(data)

###################################################################################################################################################################################################################################################################################################################
#Q5
sony_items = get_items_by_brand( data , "sony" )
# pp sony_items

def get_available_items_by_brand(items_data , brand)
	items_data[:items].select do |select_both|
		select_both[:product][:inventories][0][:availability] == "inStock" && select_both[:product][:brand] == brand.capitalize
	end
end

sony_items_available = get_available_items_by_brand(data, "sony")
# pp sony_items_available

def get_available_items_by_author(items_data, author)
	items_data[:items].select do |select_both|
		select_both[:product][:author][:name] == author && select_both[:product][:inventories][0][:availability] == "inStock"
	end
end
adorama_items_available = get_available_items_by_author(data, "Adorama Camera")
# pp adorama_items_available

def get_items_by_brand_author(items_data, brand, author)
	items_data[:items].select do |select_both|
		select_both[:product][:brand] == brand.capitalize && select_both[:product][:author][:name] == author
	end
end
nikon_ebay_items = get_items_by_brand_author(data, "nikon", "eBay")
pp nikon_ebay_items








# output item count using the getItemsCount function

