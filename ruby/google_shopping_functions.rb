require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

item_arr = data[:items]

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

# 1. Get items 

def get_items( item_data )
  item_data[:items]
end

# puts get_items(data)

# 2. Get items by brand

def get_item_by_brand(item_data, brand)
  item_data.select{|item| item[:product][:brand].downcase == brand.downcase}
end

# pp get_item_by_brand(data[:items], "canon")

# 3. Get items by author

def get_item_by_author(item_data, author)
  item_data.select{|item| item[:product][:author][:name].downcase.include? author.downcase}
end

# pp get_item_by_author(data[:items], "ebay")

# 4. Get available products 

def get_available_items(item_data)
  item_data.select{|item| item[:product][:inventories][0][:availability] == "inStock"}
end

# pp get_available_items(data[:items])


# 5. 
# Get all items made by Sony
sony_items = get_item_by_brand(data[:items], "sony")
# pp sony_items

# Get Sony items that are available
available_sony_items = get_available_items(get_item_by_brand(data[:items], "sony"))
# pp available_sony_items

# Get available items by Adorama
available_adorama_items = get_available_items(get_item_by_author(data[:items], "adorama"))
# pp available_adorama_items

# Nikon sold by ebay
nikon_sold_by_ebay = get_item_by_brand(get_item_by_author(data[:items], "ebay"), "nikon")
pp nikon_sold_by_ebay