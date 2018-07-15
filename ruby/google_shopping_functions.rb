#require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

#pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  
  item_data[:currentItemCount]

end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here
def get_items objectData
  return objectData[:items]
end

def get_items_by_brand array, brand
  return array.select{ |x|
    x[:product][:brand] == brand
  }
end

def get_items_by_author array, author
  return array.select{ |x|
    x[:product][:author][:name] == author
  }
end

def get_available_items array, avail
  return array.select{ |x|
    x[:product][:inventories][0][:availability] == avail
  }
end


# output item count using the getItemsCount function
#puts "Item Count: #{get_items_count( data )}"

# outputs items array
#get_items(data)

# outputs items by brand: Sony, Canon, Nikon, Samsung or Panasonic.
#puts get_items_by_brand(get_items(data), "Sony")

# outputs items by author name:
# puts get_items_by_author(get_items(data), "Adorama Camera")

# outputs items by brand and availability
#puts get_available_items(get_items_by_brand(get_items(data), "Sony"), "inStock")

# outputs items by author name:
puts get_items_by_author(get_items_by_brand(get_items(data), "Nikon"), "eBay")