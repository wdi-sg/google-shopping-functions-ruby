require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

def getItemCount(objectData)
  objectData.size
end

def getItems(objectData)
  objectData[:items]
end

def getItemsByBrand(items, brand)
  items.select {
    |item|
    item[:product][:brand] == brand
  }
end

def getItemsByAuthor(items, author)
  items.select {
    |item|
    item[:product][:author][:name] == author
  }
end

def getItemsByAuthorV2(items, author)
 items.select {
  |item|
  item[:product][:author][:name].include?(author)
  }
end

def getAvailableProducts(items)
  items.select {
    |item|
    item[:product][:inventories].any? {
      |inventory|
      inventory[:availability] == 'inStock'
    }
  }
end

# items = getItems(data)

# single line version
# puts "Item Count: #{getItemCount(data)}"
# puts "Items Made By Sony: #{getItemsByBrand(items, 'Sony')}"
# puts "Available Items Made By Sony: #{getItemsByBrand(getAvailableProducts(items), 'Sony')}"
# puts "Available Items By Adorama Camera: #{getItemsByAuthor(getAvailableProducts(items), 'Adorama Camera')}"
# puts "Items Made By Nikon by eBay: #{getItemsByBrand(getItemsByAuthor(items, 'eBay'), 'Nikon')}"

# verbose version
# count = getItemCount(data)
# puts "Item Count:"
# pp count

# itemsByBrand = getItemsByBrand(items, 'Sony')
# puts "Items Made By Sony:"
# pp itemsByBrand

# availableItems = getAvailableProducts(items)
# availableSony = getItemsByBrand(availableItems, 'Sony')
# puts "Available Items Made By Sony:"
# pp availableSony

# availableAdorama = getItemsByAuthor(availableItems, 'Adorama Camera')
# puts "Available Items By Adorama Camera:"
# pp availableAdorama

# eBayItems = getItemsByAuthor(items, 'eBay')
# eBayNikonItems = getItemsByBrand(eBayItems, 'Nikon')
# puts "Items Made By Nikon by eBay:"
# pp eBayNikonItems
