require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array


# Qn1
def getItemsArray( dataObject )
	dataObject[:items]
end
items=getItemsArray(data)
# get_items_array(data[:items])


#qn2
def getItemsByBrand (items,brand)
	items.select{|i| i[:product][:brand]==brand}
end

# pp getItemsByBrand(items,"Nikon")

#qn3
def getItemsByAuthor(items, author)
	items.select {|i| i[:product][:author][:name]==author}
end

# pp getItemsByAuthor(data[:items], "eBay")

#qn4

def getAvailableProducts(items)
	items.select{ |i| 
		i[:product][:inventories].any? { |inventory| 
			inventory[:availability]=="inStock" }
	}
end

# pp getAvailableProducts(data[:items])

#qn5

# All items made by Nikon with the author eBay.


pp getItemsByBrand(getItemsByAuthor(items, 'eBay'), 'Nikon')


