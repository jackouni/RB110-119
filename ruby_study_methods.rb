##############
### ARRAYS ###
##############

# all?

a = [1, :foo, 'hi']

[0, 0, 0].all?                            #=> true
[0, 1, 0].all?                            #=> true
[0,'a', 2].all?                           #=> true
[nil,'a', 2].all?                         #=> false
[nil,'a', 2].all?(true)                   #=> false
[2, 2, 2, 2].all?(2)                      #=> true
[2, 4, 6].all? { |n| n.even? }            #=> true
[2, 4, 5, 6].all? { |n| n.even? }         #=> false
['a', 'c', 'hi', :sym].all? { |_| true }  #=> true
[true, true, true].all? { |_| false }     #=> false

#------------------------------------------
#------------------------------------------

# at
a = [1, :foo, 'hi']

a.at(0) #=> 1
a.at(3) #=> nil
a.at(-1) #=> "hi"

#------------------------------------------
#------------------------------------------

# clear
a = [1, :foo, 'hi']
a.clear #=> []

#------------------------------------------
#------------------------------------------

# combination

[1, 2, 3].combination(2) { |combo| combo } #=> [1, 2, 3] (Returns self)
# Each block will return:
# => [1, 2] 
# => [1, 3]
# => [2, 3]

#------------------------------------------
#------------------------------------------

# count
[1, 2, 1, 2, 1].count(1)            #=> 3
[1, 2, 3, 4, 5].count { |n| n > 3 } #=> 2
[1, 2, 3, 4, 5].count { |n| n + 2 } #=> 5

#------------------------------------------
#------------------------------------------

# delete_if

a = ['a', 'boy', 'at', 'I', 'hey', 'halo', 'by', 'yo', 'hi']

a.delete_if { |e| e.size < 3 } #=> ['boy', 'hey', 'halo']
a                              #=> ['boy', 'hey', 'halo'] 

#------------------------------------------
#------------------------------------------

# sort

a = [2, -1, 0 , 3, 5, 4, 1]

a.sort {|a, b| b <=> a } #=> [5, 4, 3, 2, 1, 0, -1]
a.sort {|a, b| a <=> b } #=> [-1, 0, 1, 2, 3, 4, 5]
a                        #=> [2, -1, 0 , 3, 5, 4, 1]

#------------------------------------------
#------------------------------------------

# dig

a = [:foo, [:bat, 12, ['a', 'b', 'c']], :bar]

a.dig(0)                     #=> :foo
a.dig(1)                     #=> [:bat, 12, ['a', 'b', 'c']]
a.dig(1, 0)                  #=> :bat
a.dig(1, 2)                  #=> ['a', 'b', 'c']
a.dig(1, 2, 1)               #=> 'b'
a.dig(1, 2, 1) == a[1][2][1] #=> true

#------------------------------------------
#------------------------------------------

# permutation

a = [1, 2, 3]

a.permutation(2) { |permu| permu } #=> [1, 2, 3] (Returns self)
# Each block will return:
#=> [1, 2]
#=> [1, 3]
#=> [2, 1]
#=> [2, 3]
#=> [3, 1]
#=> [3, 2]

a.permutation(3) { |permu| permu} #=> [1, 2, 3] (Returns self)
# Each block will return:
#=> [1, 2, 3]
#=> [1, 3, 2]
#=> [2, 1, 3]
#=> [2, 3, 1]
#=> [3, 1, 2]
#=> [3, 2, 1]

#------------------------------------------
#------------------------------------------

# all?

a = [1, 2, 3, 4]
b = [1, 1, 1, 1]

a.all?                   #=> true
a.all? { |num| num < 5 } #=> true
a.all? { |num| num > 5 } #=> false
b.all?(1)                #=> true
b.all?(2)                #=> false
[nil, true, 'hi'].all?   #=> false

#------------------------------------------
#------------------------------------------

# any? 

a = [1, 2, 3, 4]
b = [1, 1, 2, 2]

a.any?                   #=> true
a.any? { |num| num < 5 } #=> true
a.any? { |num| num > 5 } #=> false
b.any?(2)                #=> true
b.any?(4)                #=> false
[nil, true, 'hi'].any?   #=> true

#------------------------------------------
#------------------------------------------

# none?

a = ['1', '2', '3']

a.none?                         #=> false
a.none?('0')                    #=> true
a.none?('1')                    #=> false
[nil, false].none?              #=> true
a.none? { |e| e.is_a? String }  #=> false
a.none? { |e| e.is_a? Integer } #=> true

#------------------------------------------
#------------------------------------------

# tally

a = ['a', 'a', 'c', 'b', 'b', 'b']

a.tally #=> {"a"=>2, "c"=>1, "b"=>3}

#------------------------------------------
#------------------------------------------

# max

a = [5, 3, 20, 44, 1]

a.max               #=> 44
['a', 'b', 'c'].max #=> 'c'

#------------------------------------------
#------------------------------------------

# min

a = [5, 3, 20, 44, 1]

a.min               #=> 1
['a', 'b', 'c'].min #=> 'a'

#------------------------------------------
#------------------------------------------

# select
# Given a block with each element from self; will return an Array of elements from self whose blocks return a truthy value
# "I want to 'select' any elements that match a condition"

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a.select { |num| num.even? } #=> [2, 4, 6, 8, 10]
a.select { |num| num.odd? }  #=> [1, 3, 5, 7, 9,]
a.select { |num| true }      #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a.select { |num| nil }       #=> []
a.select { |num| 'hello' }   #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

#------------------------------------------
#------------------------------------------

# reject
# Given a block with each element from self; will return an Array of elements from self whose blocks return a falsy value
# "I want to 'reject' any elements that match the condition"

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a.reject { |num| num.even? } #=> [1, 3, 5, 7, 9,]
a.reject { |num| num.odd? }  #=> [2, 4, 6, 8, 10] 
a.reject { |num| true }      #=> []
a.reject { |num| nil }       #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a.reject { |num| 'hello' }   #=> []

#------------------------------------------
#------------------------------------------
#------------------------------------------

#############
### HASHS ###
#############


# assoc
# returns an Array of the key-value pair where argument == key in self.

h = {:foo => 1, :bar => 2, :baz => 3}

h.assoc(:foo)      #=> [:foo, 1]
h.assoc(:not_here) #=> nil

#------------------------------------------
#------------------------------------------

# map
# returns an Array of the returned value from each block

h = {:a => 1, :b => 2, :c => 3} 

h.map { |k, v| k }              #=> [:a, :b, :c]
h.map { |k, v| v + 1 }          #=> [2, 3, 4]

new_h = h.map { |k, v| [k, v] } #=> [[:a, 1], [:b, 2], [:c, 3]]
new_h.to_h == h                 #=> true


#------------------------------------------
#------------------------------------------

# sort

h = {'a' => 0, 'e' => 2, 'b' => 1, 'c' => 3, 'd' => 2.5,}

h.sort { |a, b| a[0] <=> b[0] } 
#=> [ ["a", 0], ["b", 1], ["c", 3], ["d", 2.5], ["e", 2] ]

h.sort { |a, b| a[1] <=> b[1] } 
#=> [ ["a", 0], ["b", 1], ["e", 2], ["d", 2.5], ["c", 3] ]

h.sort { |a, b| b[1] <=> a[1] } 
#=> [ ["c", 3], ["d", 2.5], ["e", 2], ["b", 1], ["a", 0] ]

# note: `a` and `b` each represent a 2-element Array of key-value pairs.
# In 1st example: 
# 1st block -> a == ['a', 0] ; b == ['e', 2] 
# 2nd block -> a == ['e', 2] ; b == ['b', 1]
# etc... 

#------------------------------------------
#------------------------------------------

# <=>
# returns 1, -1 or 0 depending on if the left operand is greater than, less than or equal to right operand.

a = 20
b = 10

# Is `a` greater than `b`? Yes
a <=> b #=> 1

# Is `b` greater than `a`? No
b <=> a #=> -1

# Is `a` greater than `a`? Equal
a <=> a #=> 0

#------------------------------------------
#------------------------------------------

# each

h = {:a => 1, :b => 2, :c => 3} 

h.each { |k, v| } #=> {:a => 1, :b => 2, :c => 3} 

#------------------------------------------
#------------------------------------------

