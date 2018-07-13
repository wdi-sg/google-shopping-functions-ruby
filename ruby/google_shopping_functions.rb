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
  item_data.size
end

# First Requirement
def get_items (objectData)
  puts objectData[:items]
end


# Second Requirement
def getItemsByBrand(items, brand) 
  results = []

  items.map{ |x| if x[:product][:brand] == brand 
                    results.push(x)
                  end }

  results
end

# getItemsByBrand data[:items], 'Nikon'

# Third Requirement
def getItemsByAuthor(items, author)
  results = []

  items.map{
    |x| if x[:product][:author][:name] == author
      results.push(x)
    end
  }
  
  results
end

# getItemsByAuthor data[:items], 'Target'

# Fourth Requirement
def getAvailableProducts(items) 
  results = []

  items.map {
    |x| if x[:product][:inventories][:availability] == 'inStock'
      results.push(x)  
    end
  }

  results
end

#Fifth Requirement

def fifthShit  (data)
  ##  All items made by Sony.
    # getItemsByBrand data[:items], 'Sony'
  ##  All items made by Sony that are available.
  #   shit = getItemsByBrand(data[:items],'Sony')
  #   getAvailableProducts(shit)
  # ##  All available items by the author "Adorama Camera"
  #   shit1 = getItemsByAuthor(data[:items],'Adorama Camera')
  #   getAvailableProducts(shit1)
  ##  All items made by Nikon with the author eBay.
    

    # puts shit2
    
end

# fifthShit data




# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function
puts "Item Count: #{get_items_count( data )}"
