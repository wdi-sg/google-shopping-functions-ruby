require 'byebug'
require 'json'
require 'pp'

file = File.read('products.json')
data = JSON.parse(file, {:symbolize_names => true})

# pp data

# example function called get_items_count
# input: accepts full item data
# output: returns the length of the items array

def get_items_count( item_data )
  item_data.size
end

def get_items ( item_data )
  item_data[:items]
end

def get_items_by_brand ( item_data , input )
  item_data.find_all{|items| items[:product][:brand] == input}
end

def get_items_by_author ( item_data , input )
  item_data.find_all{|items| items[:product][:author][:name].match? input}
  # both the code above and below gives the same output
  # return_items = Array.new
  # item_data.each do |item|
  #   if item[:product][:author][:name].match? input
  #     return_items.push(item)
  #   end
  # end
  # return return_items
end

def get_available_products ( item_data )
  item_data.find_all{|items| items[:product][:inventories][0][:availability] == "inStock"}
end

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# All items made by Sony.
# All items made by Sony that are available.
# All available items by the author "Adorama Camera"
# All items made by Nikon with the author eBay.

all_items = get_items(data)

# 1)
puts get_items_by_brand( get_items(data) , "Sony" )

# 2)
question_2 = get_items_by_brand( all_items , "Sony")
puts JSON.pretty_generate(get_available_products(question_2))

# 3)
puts JSON.pretty_generate(get_items_by_author( all_items , "Adorama Camera"))

# 4)
question_4 = get_items_by_brand( all_items , "Nikon")
puts JSON.pretty_generate(get_items_by_author(question_4 , "eBay"))