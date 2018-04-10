require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

def get_items_count( item_data )

  item_data.size
end

# Define and use your functions here
#1
def get_items(objectData)
  objectData[:items]
end
items = get_items(data)

#2
def get_items_by_brand(items, brand)
  items.select { |item| item[:product][:brand] == brand }
end
# pp get_items_by_brand(items, 'Nikon')

#3
def get_items_by_author(items, author)
  items.select { |item| item[:product][:author][:name] == author }
end
# pp get_items_by_author(items, 'Target')

#4
def get_available_products(items)
  items.select { |item| 
    item[:product][:inventories].any? { |inventory|
      inventory[:availability] == 'inStock'
    }
  }
end
# pp get_available_products(items)

#5
# pp get_items_by_brand(items, 'Sony')
# pp get_items_by_brand(get_available_products(items), 'Nikon')
# pp get_items_by_author(get_available_products(items), 'Adorama Camera')
# pp get_items_by_brand(get_items_by_author(items, 'eBay'), 'Nikon')