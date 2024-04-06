=begin  
# This is a program used to quickly look up methods and their concise and succinct definitions.

FORMAT:
'method_name key'

KEY:
'b' = 'given a block with 1 parameter'
'a1' = 'given a single argument'
'b2' = 'given a block with 2 parameters'
'a2' = 'given 2 arguments'
'aaa' = 'given a number of arguments'
=end

CALLER_OBJ = 'COCOCOCOCOCO`'
BLOCK_PARAS = '`BPBPBPBPBPBPBP`'
ARG = "`ARGARGARGARGARG`"
VALUE = "`VVVVVVVVVVVV`"
ELEMENT = "`ELMELMELMELM`"

IS_INVOKED_ON = "is invoked on the caller object, #{CALLER_OBJ},"
PASSED_A_BLOCK = "passed a block with a block parameter of `#{BLOCK_PARAS}` that'll bind to the current #{ELEMENT} being iterated over in `#{CALLER_OBJ}`"
PASSED_AN_ARG = "passed a reference to #{VALUE} as an argument"
PASSED_ARGS = "passed a reference to #{VALUE} as arguments."
FOR_EACH_ITERATION = "Each iteration of the block .......... "

METHODS = {
  'Array#each' => {default: "`Array#each` #{IS_INVOKED_ON} and #{PASSED_A_BLOCK}. `Array#each` returns a the original caller object, with no regards for the returned values from the block. Each iteration of the block will"},
  'Array#map' => {default: "`Array#map` #{IS_INVOKED_ON} and #{PASSED_A_BLOCK}. `Array#map` returns a new Array of elements from the caller whose elements are the returned values from each block iteration. #{FOR_EACH_ITERATION}"},
  'Array#map!' => {default: ''},
  'Array#select' => {default: "`Array#select` #{IS_INVOKED_ON} and #{PASSED_A_BLOCK}. `Array#select` returns a new Array with elements from the caller whose respective blocks return a truthy value. #{FOR_EACH_ITERATION}"},
  'Array#select!' => {default: ''},
  'Array#filter' => {default: ''},
  'Array#filter!' => {default: ''},
  'Array#all?' => {
    a: "`Array#all?` #{IS_INVOKED_ON} and #{PASSED_AN_ARG}. `Array#all?` when given an argument will return `true` if every element from the caller is equal in value to the argument passed, otherwise `false` is returned.", 
    b: "`Array#all?` #{IS_INVOKED_ON} and #{PASSED_A_BLOCK}. `Array#all?` returns `true` if **all** block iterations return a truthy value, otherwise it returns `false`. #{FOR_EACH_ITERATION}", 
    default: "`Array#all?` #{IS_INVOKED_ON}. Given no argument or block, `Array#all?` will return `true` if all elements in the caller are truthy values, otherise it returns `false`."
  },
  'Array#any?' => {
    a: "`Array#any?` #{IS_INVOKED_ON} and #{PASSED_AN_ARG}. When given an argument, `Array#any?` returns `true` if any element from the caller is equal in value to the argument passed, otherwise `false` is returned.", 
    b: "`Array#any?` #{IS_INVOKED_ON} and #{PASSED_A_BLOCK}. When given a block, `Array#any?` returns `true` if **any** block iterations return a truthy value, otherwise it returns `false`. #{FOR_EACH_ITERATION}", 
    default: "`Array#any?` #{IS_INVOKED_ON}. Given no argument or block, `Array#any?` will return `true` if **any** elements in the caller are truthy values, otherise it returns `false`."
  },
  'Array#sort' => {b: '', default: "`Array#sort` #{IS_INVOKED_ON}. `Array#sort`, when given no block, returns a new Array with elements from the caller sorted by value from least to greatest."},
  'Array#sort!' => {b: '', default: 'bleh'},
  'Array#sort_by' => {b: '', default: 'bleh'},
  'Array#sort_by!' => {b: '', default: 'bleh'},
  'Array#[]' => {a: '', a2: '', r: '', default: 'bleh'},
  'Array#slice' => {a: '', a2: '', r: '', default: 'bleh'},
  'Array#uniq' => {b: '', default: 'bleh'},
  'Array#uniq!' => {b: '', default: 'bleh'},
  'Array#sum' => {a: '', default: 'bleh'},
  'Array#count' => {a: '', b: '', default: 'bleh'},
  'Array#each_with_index' => {default: ''},
  'Hash#each' => {b: '', b2: '', default: 'bleh'},
  'Hash#each_pair' => {b: '', b2: '', default: 'bleh'},
  'Hash#select' => {b: '', b2: '', default: 'bleh'},
  'Hash#select!' => {b: '', b2: '', default: 'bleh'},
  'Hash#filter' => {b: '', b2: '', default: 'bleh'},
  'Hash#filter!' => {b: '', b2: '', default: 'bleh'},
  'Hash#values' => {default: ''},
  'Hash#keys' => {default: ''},
  'Hash#key?' => {default: ''},
  'Hash#has_key?' => {default: ''},
  'Hash#value?' => {default: ''},
  'Hash#has_value?' => {default: ''},
  'Hash#delete' => {default: ''},
  'Enum#map' => {b: '', b2: '', default: 'bleh'},
  'String#chars' => {default: ''},
  'String#each_char' => {default: ''}
}

def clear_display
  system 'clear'
end

def display_divider
  puts "--------------------------------------------------------------------------------------------------------------------------------"
end

def display_menu
  puts "=> Format: 'Type#name key'"
  puts "=> Keys:'a', 'a2', 'b', 'b2', 'r', 'na'"
  display_divider
end

def user_input
  print ">> "
  input = gets.chomp
  get_lookup(input)
end

def get_lookup(input)
  inputs = input.split
  method_name = inputs[0].downcase.capitalize
  case inputs.size
  when 1 then [method_name, :default]
  else
    [method_name, inputs[1].to_sym]
  end 
end

def display_lookup(lookup)
  puts METHODS.dig(lookup[0], lookup[1])
end

last_lookup = ' '

loop do
  display_menu
  display_lookup(last_lookup)
  display_divider
  lookup = user_input
  last_lookup = lookup
  display_divider
  display_lookup(lookup)
  clear_display
end
