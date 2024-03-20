require 'pry'
require 'pry-byebug'
# #--------------------------#
# #--------PROBLEM 1---------#
# #--------------------------#

# =begin 
#   Create a method that takes a word/phrase and returns a ciphered version of that word/phrase.
#   The vowels of the word/phrase will be converted to the next vowel proceeding it in the alphabet
#   and consonants  will be converted to the previous consonant preceding it in the alphabet.
#   All uppercase letters will be converted to lowercase and vice-versa.
#   Any other non-letter characters won't be changed or altered.
# =end

# ### MY ANSWER :
# VOWELS = ['A', 'E', 'I', 'O', 'U']
# CONSONANTS = ['B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z']

# def cipher_this(word)
#   ciphered_chars = []

#   word.chars.each do |char|
#     if is_vowel?(char)
#       index = vowel_index(char) + 1
#       case is_upcase?(char)
#       when true then ciphered_chars << VOWELS[index].downcase
#       when false then ciphered_chars << VOWELS[index]
#       end
#     elsif is_consonant?(char)
#       index = consonant_index(char) - 1
#       index = 0 if index == 21
#       case is_upcase?(char)
#       when true then ciphered_chars << CONSONANTS[index].downcase
#       when false then ciphered_chars << CONSONANTS[index]
#       end 
#     else
#       ciphered_chars << char
#     end 
#   end

#   ciphered_chars.join
# end

# def is_vowel?(char)
#   VOWELS.include? char.upcase 
# end

# def is_consonant?(char)
#   CONSONANTS.include? char.upcase 
# end

# def is_upcase?(char)
#   char == char.upcase
# end

# def vowel_index(char)
#   VOWELS.index(char.upcase)
# end

# def consonant_index(char)
#   CONSONANTS.index(char.upcase)
# end

# # Test Cases:
# p cipher_this('a') == "E"
# p cipher_this('z') == "Y"
# p cipher_this("Hello World") == "gIKKU vUQKC"
# p cipher_this('RB110 is hard?') == "qz110 OR GEQC?"
# p cipher_this('!#/?') == "!#/?"

# #####

# #--------------------------#
# #--------PROBLEM 2---------#
# #--------------------------#

# =begin  
#   Task:
#     You are tasked with creating a Ruby method named sort_and_filter that takes an array of hashes as its argument. 
#     Each hash in the array represents a product, with keys for
#     :name (a string), :category (a string), and :price (a floating-point number).
#     The method should perform the following tasks:
#       1. Filter out products that have a price greater than a specified threshold.
#       2. Sort the remaining products first by their category in ascending alphabetical order, 
#       and then by their price in descending order within each category.
#       3. Return the filtered and sorted list of products.

#   Requirements:
#     • The sort_and_filter method should accept two arguments: the array of products and the price threshold.
#     • Assume the input array can contain any number of products, and the products can belong to any number of categories.
#     • The returned array should contain hashes of products that are both below the specified price threshold and sorted
#     according to the specified conditions.
# =end


# products = [
#   {name: "Laptop", category: "Electronics", price: 1000.0},
#   {name: "Sofa", category: "Furniture", price: 250.0},
#   {name: "Coffee Maker", category: "Appliances", price: 70.0},
#   {name: "Desk Lamp", category: "Electronics", price: 20.0},
#   {name: "Wooden Chair", category: "Furniture", price: 45.0},
#   {name: "Smartphone", category: "Electronics", price: 500.0},
#   {name: "Bookshelf", category: "Furniture", price: 150.0},
#   {name: "Hand Blender", category: "Appliances", price: 30.0},
#   {name: "Bar Stool", category: "Furniture", price: 48.0},
#   {name: "Thingy-Ma-Doo", category: "Appliances", price: 35.0},  
#   {name: "Alarm Clock", category: "Electronics", price: 20.50},
# ]

# ### MY ANSWER :

# def sort_and_filter(products, threshold)
#   price_filtered_products = products.reject { |product| product[:price] > threshold } 
#   categories = generate_categories_hash(price_filtered_products)
#   add_products_to_categories!(price_filtered_products, categories)
#   categories = categories.sort { |a, b| a <=> b }.to_h

#   filtered_products = []

#   categories.each_key do |products|
#     filtered_products << sorted_products_by_price(categories[products])
#   end

#   filtered_products.flatten
# end

# def sorted_products_by_price(products)
#   products.sort { |a, b| b[:price] <=> a[:price] }
# end

# def generate_categories_hash(products)
#   categories = {}
#   products.each do |product|
#     categories[product[:category]] = []
#   end
#   categories
# end

# def add_products_to_categories!(products, categories)
#   products.each do |product|
#     categories.each_key do |category|
#       categories[category] << product if product[:category] == category
#     end
#   end
# end

# # Test Cases:
# p sort_and_filter(products, 50) == [
#   {:name=>"Thingy-Ma-Doo", :category=>"Appliances", :price=>35.0},
#   {:name=>"Hand Blender", :category=>"Appliances", :price=>30.0},
#   {:name=>"Alarm Clock", :category=>"Electronics", :price=>20.5},
#   {:name=>"Desk Lamp", :category=>"Electronics", :price=>20.0},
#   {:name=>"Bar Stool", :category=>"Furniture", :price=>48.0},
#   {:name=>"Wooden Chair", :category=>"Furniture", :price=>45.0}
# ]

# p sort_and_filter(products, 30) == [{:name=>"Hand Blender", :category=>"Appliances", :price=>30.0},
# {:name=>"Alarm Clock", :category=>"Electronics", :price=>20.5},
# {:name=>"Desk Lamp", :category=>"Electronics", :price=>20.0}]
  
# p sort_and_filter(products, 15) == []

#####

#--------------------------#
#--------PROBLEM 3---------#
#--------------------------#

=begin  
  Create a method that takes an array of Integers 
  and returns an array with all the elements of the input array in order or highest value to lowest.
  ((You cannot use Ruby's `sort` method))
=end

=begin  
===PEDAC===
P 
  Input: Array or Integers
  Output: Same Array of Integers but sorted in order of highest to lowest value.

  - Looping through each element of input_array and being able to compare it with the previous or succeeding element
  - Determining a break case

D 
  - Arrays (input_array and sorted_array)

ALGO:
  1. SET count_pass = 0 ((Determines if the array has been sorted)) 
  2. SET counter = 0 ((For looping through the array))
  3. LOOP until count_pass == input_arr.size - 1
  3.  LOOP over each index of input_arr
  4.    BREAK IF index + 1 == input_arr.length
  5.    SET current_value = input_arr[counter]
  5.   IF current_value < input_arr[counter + 1]
  6.    input[counter] = input_arr[counter + 1]
  7.    input[counter + 1] = current_value
  8.   ELSE count_pass += 1
  9.   counter += 1
 10.  CLOSE LOOP
 11. CLOSE LOOP
 12. RETURN input_arr
=end

def sort_it(arr)
  arr_copy = []
  arr.each { |e| arr_copy << e}

  pass_count = 0
  counter = 0
  loop do
    loop do
      break if counter == arr_copy.size - 2
      current_value = arr_copy[counter]
      next_value = arr_copy[counter + 1]
      if current_value < next_value

end

p sort_it([1,2,3])

# # Test Cases:
# p sort_it([1, 2, 3]) == [3, 2, 1]
# p sort_it([3, 12, 100, 1, -2, 0, 12]) == [100, 12, 12, 3, 1, 0, -2]
# p sort_it([]) == []
# p sort_it(['a', 'b']) == []
# p sort_it([0, -100, -2, 100, 2]) == [100, 2, 0, -2, -100]

arr = [1, 2, 3]
b = arr[1]

arr[1] += 1

p arr[1]
p b