=begin  
# This is a program used to quickly look up methods and their concise and succinct definitions.

FORMAT:
'method_name key'

KEY:
'b1' = 'given a block with 1 parameter'
'a1' = 'given a single argument'
'b2' = 'given a block with 2 parameters'
'a2' = 'given 2 arguments'
'aaa' = 'given a number of arguments'
=end

METHODS = {
  'Array#each' => {a1: 'n/a', a2: 'n/a', b1: '', b2: '', aaa: 'n/a'},
  'Array#map' => {a1: 'n/a', a2: 'n/a', b1: '', b2: '', aaa: 'n/a'},
  'Array#map!' => {a1: 'n/a', a2: 'n/a', b1: '', b2: '', aaa: 'n/a'},
  'Array#select' => {a1: '', a2: '', b1: '', b2: '', aaa: 'n/a'},
  'Array#select!' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#filter' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#filter!' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#all?' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#any?' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#sort' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#sort!' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#sort_by' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#sort_by!' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#[]' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#slice' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#uniq' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#uniq!' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#sum' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#count' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Array#each_with_index' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#each' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#each_pair' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#select' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#select!' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#filter' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#filter!' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#values' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#keys' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#key?' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#has_key?' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#value?' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#has_value?' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#delete' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Hash#delete' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'Enum#map' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'String#chars' => {a1: '', a2: '', b1: '', b2: '', aaa: ''},
  'String#each_char' => {a1: '', a2: '', b1: '', b2: '', aaa: ''}
}