require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})


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

def getItems( item_data )

  item_data[:items]

end

def getItemsByBrand( item_data )

  item_data.each do |item|

    puts "#{item[:product][:brand]}"

  end

  # item_data.each do |item|

  #   puts "#{item[:product][:brand]}"

  # end

end

# output item count using the getItemsCount function
puts "Item Count: #{get_items_count( data )}"

items = getItems(data)

getItemsByBrand(items)
