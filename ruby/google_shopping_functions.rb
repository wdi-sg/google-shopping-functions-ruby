require 'byebug'
require 'json'
require 'pp'


file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )

  item_data.size
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"


def getItems(objectData)
  objectData[:items]
end


# puts "Items :  #{getItems(data)}"

items = getItems(data)

def getItemsByBrand(items, brand)

  result = []

  items.each do |item|
    if item[:product][:brand].downcase == brand.downcase
      result.push(item)
    end
  end
  return result
end

# pp getItemsByBrand(items, "Canon")
# puts "No of Items = Canon: #{getItemsByBrand(items, "Canon")}"

def getItemsByAuthor (items, author)
  result = []
  items.each do |item|
    if item[:product][:author][:name].downcase.include?(author.downcase)
      result.push(item)
    end
  end
  return result
end

# pp getItemsByAuthor(items, "pictureline.com")
# puts "No of items = pictureline.com: #{getItemsByAuthor(items, "pictureline.com")}"

def getAvailableProducts(items)
  result = []
  items.each do |item|
    if item[:product][:inventories][0][:availability] == "inStock"
      result.push(item)
    end
  end
  return result
end

#pp getAvailableProducts(items)
# puts "No of items = available: #{getAvailableProducts(items)}"

pp getItemsByBrand(items, "Sony")
pp getItemsByBrand(getAvailableProducts(items), "Sony")
pp getItemsByAuthor(items, "Adorama Camera")
pp getItemsByAuthor(getItemsByBrand(items, "Nikon"), "eBay")
puts "No of items by nikon with author eBay:  #{getItemsByAuthor(getItemsByBrand(items, "Nikon"), "eBay")}"