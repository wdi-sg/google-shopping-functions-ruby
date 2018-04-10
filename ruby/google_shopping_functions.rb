require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

$data = data[:items]
# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  item_data[:items].length
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here
def get_items_by_brand(items, brand)
  if (items.class == Array)
    data = items
  else
    data = items[:items]
  end
  data.select{|item| item[:product][:brand].downcase == brand.downcase}
end

def get_items_by_author(items, author)
  if (items.class == Array)
    data = items
  else
    data = items[:items]
  end
  data.select{|item| item[:product][:author][:name].downcase.include?(author.downcase)}
end

def get_available_products(items)
  if (items.class == Array)
    data = items
  else
    data = items[:items]
  end
  data.select{|item| item[:product][:inventories][0][:availability] == 'inStock'}
end

# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"

# puts "Items made by Sony: "
# pp get_items_by_brand( data, 'Nikon')

# puts "Items made by Sony that are available: "
# pp get_available_products(get_items_by_brand(data, 'Sony'))

# puts "Items by Adorama Camera that are available: "
# pp get_available_products(get_items_by_author(data, 'Adorama Camera'))

# puts "All items made by Nikon with the author eBay: "
# pp get_items_by_author(get_items_by_brand(data, 'Nikon'), 'eBay')
