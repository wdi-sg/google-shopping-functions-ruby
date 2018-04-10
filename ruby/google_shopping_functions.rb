require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

#pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  #byebug
  item_data.size
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

def get_items(item_data)
  item_data[:items] 
end

def get_items_by_brand(items, brand)
  brand_items = []
  items.each do |item|
    if item[:product][:brand] == brand
      brand_items.push(item)
    end
  end
  brand_items
end

def get_items_by_author(items, author)
  author_items = []
  items.each do |item|
    if item[:product][:author][:name] == author
      author_items.push(item)
    end
  end
  author_items
end 

def get_available_products(items)
  available_items = []
  items.each do |item|
    inventories = item[:product][:inventories]
    inventories.each do |inventory|
      if inventory[:availability] == 'inStock'
        available_items.push(item)
        next
      end
    end
  end
  available_items
end
# output item count using the getItemsCount function
#puts "Item Count: #{get_items_count( data )}"
#puts "Items : #{get_items( data )}"
#puts "Sony Items: #{get_items_by_brand(get_items(data), 'Sony')}"
#puts "Canon Items: #{get_items_by_brand(get_items(data), 'Canon')}"
#puts "Nikon Items: #{get_items_by_brand(get_items(data), 'Nikon')}"
#puts "Panasonic Items: #{get_items_by_brand(get_items(data), 'Panasonic')}"
#puts "Target Items: #{get_items_by_author(get_items(data), 'Target')}"
#puts "CDW Items: #{get_items_by_author(get_items(data), 'CDW')}"
#puts "eBay Items: #{get_items_by_author(get_items(data), 'eBay')}"
#puts "Available Items: #{get_available_products(get_items(data))}"
sony_items = get_items_by_brand(get_items(data), 'Sony')
#pp sony_items
available_sony_items = get_available_products(sony_items)
pp available_sony_items
author_items = get_available_products(get_items_by_author(get_items(data),'Adorama Camera'))
pp author_items
nikon_items = get_items_by_brand(get_items(data), 'Nikon')
nikon_ebay_items = get_items_by_author(nikon_items, 'eBay')
pp nikon_ebay_items
