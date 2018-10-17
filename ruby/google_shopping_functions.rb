require 'byebug'
require 'json'
require 'pp' #pretty printed output

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  item_data.size
end

def get_items ( item_data)
  item_data[:items]
end

def getItemsByBrand (items, brand) #use get_items to get the items from the data!
  items.select { |item| item[:product][:brand] == brand } #returns back an array!
end

def getItemsByAuthor(items, authorName)
  items.select { |item| item[:product][:author][:name] == authorName}
end

def getAvailableProducts(items)
  items.find_all { |item| item[:product][:inventories][0][:availability] == 'inStock'}
end



# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function
# puts "Item Count: #{get_items_count( data )}"
# puts "Get Items: #{get_items( data )}"
# puts "Get Items by brand: #{getItemsByBrand( get_items(data) , 'Sony' )}"
# puts "Get Items by name: #{getItemsByAuthor( get_items(data) , 'Target' )}"
# puts "Get available items: #{getAvailableProducts( get_items(data))}"


#Qn5:
#All items made by Sony
#puts "Items made by Sony: #{getItemsByBrand( get_items(data), 'Sony')}"

#All items made by Sony that are available.
availableItems = getAvailableProducts( get_items(data))
availableProductsThatIsSony = getItemsByBrand(availableItems, "Sony")
# pp availableProductsThatIsSony

#All available items by the author "Adorama Camera"
availableItems = getAvailableProducts( get_items(data))
itemMadeByAdoramaCamera = getItemsByAuthor( availableItems, "Adorama Camera")
# pp itemMadeByAdoramaCamera #nothing! not available!

#All items made by Nikon with the author eBay.
itemsAuthoreBay = getItemsByAuthor(get_items(data), "eBay")
itemsThenMadeByNikon = getItemsByBrand(itemsAuthoreBay, "Nikon")
#pp itemsThenMadeByNikon





