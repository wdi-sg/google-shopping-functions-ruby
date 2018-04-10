require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  # Get number of items in the json file
  item_data.size
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function
puts "Item Count: #{get_items_count( data )}"

# 1.) getItems(objectData)
def getItems( item_data )
  return item_data[:items]
end

# 2.) getItemsByBrand(items, brand)
def getItemsByBrand(items, brand)
  itemsByBrand = {
    :items => []
  }
  items.each do |item|
    if item[:product][:brand] == brand
      itemsByBrand[:items].push(item)
    end
  end
  return itemsByBrand[:items]
end

# 3.) getItemsByAuthor(items, author)
def getItemsByAuthor(items, author)
  itemsByAuthor = {
    :items => []
  }
  items.each do |item|
    if item[:product][:author][:name] == author
      itemsByAuthor[:items].push(item)
    end
  end
  return itemsByAuthor[:items]
end

# 4.) getAvailableProducts(items)
def getAvailableProducts(items)
  availableProducts = {
    :items => []
  }
  items.each do |item|
    if item[:product][:inventories][0][:availability] == 'inStock'
      availableProducts[:items].push(item)
    end
  end
  return availableProducts[:items]
end

# 5.) Use your functions
# ------------------------------All items made by Sony.--------------------------------------
# pp getItemsByBrand(getItems(data), "Sony")

# -------------------All items made by Sony that are available.------------------------------
# pp getAvailableProducts(getItemsByBrand(getItems(data), "Sony"))

# ----------All available items by the author "Adorama Camera"---------------------------
# pp getAvailableProducts(getItemsByAuthor(getItems(data), "Adorama Camera"))

# ---------All items made by Nikon with the author eBay.---------------------------
pp getItemsByAuthor(getItemsByBrand(getItems(data), "Nikon"), "eBay")
