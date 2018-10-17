require 'byebug'
require 'json'
require 'pp'

file = File.read('../products.json')
data = JSON.parse(file, {:symbolize_names => true})

#pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )

  item_data.size
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here
def get_items ( item_data )
	item_data[:items]
end

itemsArray = get_items( data )



def getItemsByBrand(items, brand)
  brands = Array.new
	
  items.each do | k |
    if k[:product][:brand] == brand
      brands.push(k[:product])
    end
  end
    puts "Item Count3: #{brands}"
end




def getItemsByAuthor( items, author)
  names = Array.new
  
  items.each do | k |
    if k[:product][:author][:name] == author
      names.push(k[:product])
    end
  end
  puts "Item Count4: #{names}"
end






def getAvailableProducts( items)
  prods = Array.new
  
  items.each do | k |
    if k[:product][:inventories][0][:availability] == "inStock"
      prods.push(k[:product])
    end
  end
  puts "Item Count5: #{prods}"
end



# output item count using the getItemsCount function
puts "Item Count: #{get_items_count( data )}"

#itemsArray = get_items( data )
#puts "Ayyay: #{itemsArray}"

#getItemsByBrand( itemsArray, "Sony")

#getItemsByAuthor(itemsArray, "Adorama Camera")

getAvailableProducts(itemsArray)


