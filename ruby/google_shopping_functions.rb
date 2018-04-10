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

# use byebug to set a breakpoint
#byebug

# Define and use your functions here

# output item count using the getItemsCount function
puts "Item Count: #{get_items_count( data )}"

#qn1
def get_items(input)
  input[:items]
end

#qn2
def get_items_by_brand(input, brand)
  ans = input[:items].select {|item| item[:product][:brand] == brand}
  ans.map {|ans| ans[:product][:title]}
end
# puts get_items_by_brand(data, "Sony")

#qn3
def get_items_by_author(input, author)
  ans = input[:items].select {|item| item[:product][:author][:name].include?(author)}
  ans.map {|ans| ans[:product][:title]}
end
# puts get_items_by_author(data, "eBay")

#qn4
def get_available_products(input)
  ans = input[:items].select {|item| item[:product][:inventories][0][:availability] == "inStock"}
  ans.map {|ans| ans[:product][:title]}
end
# puts get_available_products(data)

#qn5a
# puts get_items_by_brand(data, "Sony")

#qn5b
available_Sony_products = (get_items_by_brand(data, "Sony") & get_available_products(data))
# puts available_Sony_products

#qn5c
available_adorama_camera = (get_items_by_author(data, "Adorama Camera") & get_available_products(data))
# puts available_adorama_camera

#qn5d
nikon_brand_eBay_author = (get_items_by_brand(data, "Nikon") & get_items_by_author(data, "eBay"))
# puts nikon_brand_eBay_author