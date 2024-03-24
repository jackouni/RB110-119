# <ins>RB119 Methods Study Guide</ins>
The methods in this study guide are methods that may be helpful in mastery of RB110 and RB119 material. Most of the methods in this document are focused on iterative Ruby methods.

## Format for explaining iterative methods:
The framework I follow for explaining iterative methods with blocks is this:
1. **State what is happening:**
    1. State what method is being called and on what caller object:</br> 
    - *"`#some_method` is invoked on the caller object `caller_obj`..."*
    2. State what argument is being passed (if any):</br> 
    - *"... with a reference to `value` passed as an argument ..."*
    3. Explain the block (if any): </br>
    - *"and is then passed a block with block parameter, `para` that'll bind to the current `element` being iterated over in `caller_obj`..."*

2. **State what the method does:**
    1. What the method returns:</br>
      - *"`some_method` (when given a block, argument, both, etc... ) returns [ 'the calling object' / 'a new array' / 'a new hash' / 'a boolean' ] "*
    2. If/How it uses the return values from blocks:</br>
      - *"... with no regard to the return value of each block iteration."*</br>
      - *"... populated with the return values from each block iteration."*</br>
      - *"... each element being iterated over is mutated to its respective block's return value"* </br>
      - *"... with elements from caller whose respective blocks return `true` / `false`"*

3. **Explain what's happening in each block iteration:**
    1. *"Each iteration of the block will execute `xyz`"*
    2. **If there's a method nested in this block, go back to line 1 and repeat**
    3. Optional: 
    - *"`xyz` will (explain in **practical terms** what will be returned or outputted from `xyz`)..."*
    4. If it does do something with the return value: 
    - *"the return value of `xyz` is then returned from the current block iteration"*

5. **Explain what the return and/or side-effect of the method is:**
    - *"This will result in outputs of: ..."*
    - *"`some_method` then returns the caller object, `caller_obj`."*
    - *"This will result in `caller_obj.some_method` returning [a new Array /a new Hash / an Integer / a Boolean] of `value`."*
    - *"This will result in `caller_obj` being mutated to `value`."*

#### Caveat:
> This is just a rough guideline, there are times where you can't follow this guide to a 'T' and that's okay. You will also have to find a way to explain/incorporate the relevance and use of the argument(s) (if any) in your explanations. Some of this stuff you can omit as well, this depends on what the question is asking and the level of precision that is being asked of you. This is just somewhere to start so you can find your own flavour of explaining code.

---
---

# The Essentials:
> These are methods that are pretty essential to know and understand if you want to take on problems in Ruby that'll involve collections like Ranges, Hashs or Arrays. You could technically do most things with just using a couple of these methods, but knowing all of these will keep you from having to build a lot of these method's functionality from scratch and save you a ton of time and effort.

<br>

## 📋 Array Methods 📋

### *Array#each { |element| ...}*
<details>
<summary>Description:</summary>
`Array#each` when given a block with each element from the caller, will return the original calling object, with no regards to the return values from the block.
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
arr = [1, 2, 3, 4]
arr.each { |num| puts num}
```
<details>
<summary>Explanation:</summary>
`each` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `each` returns a the original caller object, with no regards for the returned values from the block. Each iteration of the block will invoke `puts num`, resulting in '1', '2', '3', and '4' being outputted the terminal. The original calling object is then returned.
</details>

---

### *Array#map* / *Array#collect { |element| ...}*
<details>
<summary>Description:</summary>
`Array#map` when given a block with each element from the caller, will return a new Array populated with the returned values from each block iteration. 
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
arr = [1, 2, 3, 4]
arr.map { |num| num + 1}
```
<details>
<summary>Explanation:</summary>
`map` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `map` returns a new Array whose elements are the returned values from each block iteration. Each iteration of the block will return the value of `num + 1`, resulting in a new Array of `[2, 3, 4, 5]` being returned from `map`.
</details>

---

### *Array#select* / *Array#filter(arg) { |element| ...}*
<details>
<summary>Description:</summary>
`Array#select` when given a block with each element from the caller, will return a new Array with elements from the caller whose respective blocks return a truthy value.
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
arr = [1, 2, 3, 4]
arr.select { |num| num.odd? }
```
<details>
<summary>Explanation:</summary>
`select` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `select` returns a new Array with elements from the caller whose respective blocks return a truthy value. Each iteration of the block will invoke `odd?` on the current element being iterated over and if the current element is an odd Integer, `odd?` returns `true`. This will result in `select` returning a new Array of `[1, 3]`.
</details>

---

### *Array#all?(arg) { |element| ...}*
<details>
<summary>Description:</summary>
`Array#all?` when given an argument will return `true` if every `element` from the caller is equal to the argument, otherwise `false` is returned. When given no argument and a block with each `element` from the caller, will return `true` if **all** blocks return a truthy value, otherwise `false` is returned.
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
arr = [1, 2, 3, 4]
arr.all? { |num| num < 5 }
```
<details>
<summary>Explanation:</summary>
`all?` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `all?` returns `true` if **all** blocks return a truthy value, otherwise it returns `false`. Each iteration of the block will evaluate the expression, `num < 5`. Because every element in the calling Array is less than `5`, every block returns `true` resulting in `all?` returning `true`.
</details>

---

### *Array#any?(arg) { |element| ...}*
<details>
<summary>Description:</summary>
`Array#any?` when given an argument will return `true` if any `element` from the caller is equal to the argument, otherwise `false` is returned. When given no argument and a block with each `element` from the caller, will return `true` if **any** blocks return a truthy value, otherwise `false` is returned.
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
arr = [1, 2, 3, 4]
arr.any? { |num| num > 3 }
```
<details>
<summary>Explanation:</summary>
`any?` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `any?` returns `true` if **any** block returns a truthy value, otherwise it returns `false`. Each iteration of the block will evaluate the expression, `num > 3`. Because the last element of `arr`, `4`, is greater than `3`, `true` is returned for that block resulting in `any?` returning `true`.
</details>

---

### *Array#sort {|element1, element2| ...}*
<details>
<summary>Description:</summary>
`Array#sort` when given no block will return a new array with the elements from the caller, rearranged in an order from least to greatest value. When given a block with 2 elements to compare against from caller, will return a new array of the elements from the caller arranged in a certain order based on the return values of each block. The block needs to return either `0`, `1`, or `-1`, indicating that the first element is equal to, greater than or less than the second element it's being compared against, respectively. This is generally done using the spaceship operator (`<=>`). Given the block's return value, the method will sort the elements in the new array accordingly (how this works under the hood is beyond the scope of this document).
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
arr = [1, 3, 5, 4, 2]
arr.sort
```
<details>
<summary>Explanation:</summary>
`sort` is invoked on the caller object `arr`. `sort`, when given no block, returns a new Array with elements from the caller sorted by value from least to greatest. In this example, `sort` will return a new Array of `[1, 2, 3, 4, 5]`.
</details>

---

### *Array#sort_by {|element| ...}*
<details>
<summary>Description:</summary>
`Array#sort_by` when given a block with each element from caller, will return a new array of the elements from the caller arranged in order from least to greatest value of the return values of their respective block. 
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
arr = ['this', 'is', 'not', 'hack', 'n', 'slash']
arr.sort_by { |word| word.size }
```
<details>
<summary>Explanation:</summary>
`sort_by` is invoked on the caller object `arr` and passed a block with a block parameter of `word` that'll bind to the element currently being iterated over in `arr`. `sort_by` returns a new Array of the elements from the caller, sorted in order from least to greatest value by their respective block's return value. For each block iteration the the `size` method is invoked on the current element being iterated on, returning the element's character length from the block. This will result in a new Array of the elements from the caller sorted in order of least to greatest character length,`["n", "is", "not", "this", "hack", "slash"]`. 
</details>

---

### *Array#map!* / *Array#collect! { |element| ...}*
<details>
<summary>Description:</summary>
`Array#map` when given a block with each element from the caller, each element being iterated over is mutated to its respective block's return value.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code is doing and why:
arr = [1, 2, 3, 4]
arr.map! { |num| num * 2}
```
<details>
<summary>Explanation:</summary>
`map!` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `map!` mutates each element in the caller to its respective block's return value. Each iteration of the block will return the value of `num * 2`, resulting in `arr` mutating to: `[2, 4, 6, 8]`.
</details>

---

### *Array#select!* / *Array#filter! { |element| ...}*
<details>
<summary>Description:</summary>
`Array#select` when given a block with each element from the caller, mutates the caller to an Array of elements from itself whose respective blocks return a truthy value.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code is doing and why:
arr = [1, 2, 3, 4, 5]
arr.select! { |num| num.even? }
```
<details>
<summary>Explanation:</summary>
`select!` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `select!` mutates the caller to an Array of elements from itself whose respective blocks return a truthy value. For each block iteration `even?` is invoked on `num`, returning `true` from the block if `num` is an even Integer, this results in `select!` mutating `arr` to an Array of `[2, 4]`.
</details>

---

### *Array#sort! { |element1, element2| ...}*
<details>
<summary>Description:</summary>
`Array#sort` when given no block or argument, mutates the caller to an Array of elements from itself arranged in an order from least to greatest value. When given a block with 2 element's to compare against from the caller, will mutate the caller to an Array of elements from itself arranged in a certain order depending on the return values from the block. The block needs to return either `0`, `1`, or `-1`, indicating that the first element is equal to, greater than or less than the second element it's being compared against, respectively. This is generally done using the spaceship operator (`<=>`). Given the block's return value, the method will sort the elements accordingly (how this works under the hood is beyond the scope of this document).
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code is doing and why:
arr = [12, 2, 13, 42, 5]
arr.sort!
```
<details>
<summary>Explanation:</summary>
`sort!` is invoked on the caller object `arr`. `sort!` when given no block, mutates the caller to an Array of elements from itself arranged in an order from least to greatest value. This will result in `sort!` mutating the caller to an Array of `[2, 5, 12, 13, 42]`.
</details>

---

### *Array#sort_by! {|element| ...}*
<details>
<summary>Description:</summary>
`Array#sort_by` when given a block with each element from caller, will mutate the caller to an Array of elements from itself arranged in order from least to greatest value by their respective block's return value. 
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code is doing and why:
arr = [ [1, 2, 3], [6], [4, 5] ]
arr.sort_by! { |subarr| subarr.size }
```
<details>
<summary>Explanation:</summary>
`sort_by` is invoked on the caller object `arr` and passed a block with a block parameter of `word` that'll bind to the element currently being iterated over in `arr`. `sort_by` mutates the caller to an Array of elements from itself, sorted in order from least to greatest value by their respective block's return value. For each block iteration the the `size` method is invoked on the current element being iterated on, returning the element's length from the block. This will result in `arr` being mutated to an Array of,`[[6], [4, 5,], [1, 2, 3]]`. 
</details>

### *Array#[]* / *Array#slice(start_ind, amount)*
**Note:** </br>
Ruby uses some syntactical sugar for `Array#[]`: `arr[x, y] == arr.slice(x, y)` and `arr[x..y] == arr.slice(x..y)` </br>
Although you can use `Array#[]` with *"formal"* syntax if you'd like (not recommended): `arr[x, y] == arr.[](x, y)` (ew)

<details>
<summary>Description:</summary>
`Array#slice` when given a single argument of an index offset, will return the element from the caller of that index offset.</br>
When given a single argument of a Range, will return a new Array of elements from the caller, whose index offsets fall between the Range argument given. </br>
When given 2 arguments, the first representing the starting index offset and the second representing the amount of elements to return from the starting index; will return a new Array of elements from the caller, starting from the element at the starting index offset and the following amount of elements from it.

**Note:**</br>
If start index is out of range, `nil` is returned. There are some other weird behaviours that can be observed with `Array#slice`, but they aren't necessary to learn for the scope of this lesson (but worth noting if you want to go looking for them 😉).
</details>

<b>Practice Example #1:</b>
```ruby
# Explain what this code is doing and why:
arr = [8, 6, 7, 5, 3, 0, 9]
arr[2, 3]
```
<details>
<summary>Explanation:</summary>
`Array#[]` is invoked on the caller object `arr` and given 2 arguments:
- `2`, representing the starting index offset </br>
- `3`, representing the number of elements from select following the index offset (including the element at the starting index offset)</br>
`Array#[]` will return a new Array of elements from the caller, starting from the element at the starting index offset and the following amount of elements from it. </br>
In this example, the new Array `[7, 5, 3]` is returned from `arr[2, 3]`.
</details>

### *Array#uniq { |element| ...}*

<details>
<summary>Description:</summary>
`Array#uniq` when given no block, will return a new Array of elements from the caller but, without any duplicate elements. </br>
When given a block with each element from the caller, will return a new Array of the first elements from the caller whose respective block's return a unique value. This means there'll be no two elements whose respective blocks returned a duplicate value in the new Array.
</details>

<b>Practice Example #1:</b>
```ruby
# Explain what this code is doing and why:
arr = [0, 1, 0, 0, 1, 1, 2, 2, 3]
arr.uniq
```
<details>
<summary>Explanation:</summary>
`Array#uniq` is invoked on the caller object `arr`. `Array#uniq` returns a new Array of elements from the caller but, without any duplicate elements. This will result in `arr.uniq` returning a new Array of `[0, 1, 2, 3]`.
</details>

<b>Practice Example #2:</b>
```ruby
# Explain what this code is doing and why:
arr = ['a', 'b', 'ab', 'ac', 'abc', 'def']
arr.uniq { |str| str.size }
```
<details>
<summary>Explanation:</summary>
`Array#uniq` is invoked on the caller object `arr` and passed a block with a block parameter of `str`, which will bind to the element currently being iterated over in the caller. `Array#uniq` when given a block will return a new Array of the first elements from the caller whose respective block's return a unique value. This means there will be no two elements in the new Array whose block's returned values are duplicates. For each iteration of the block `str.size` is executed, returning the character length of `str`. This return value is then implicitly returned for each iteration of the block. This will result in `arr.uniq` returning a new Array of `['a', 'ab', 'abc']`.
</details>

---

### *Array#sum*
<details>
<summary>Description:</summary>
`Array#sum` returns an Integer object, representing the sum of all the elements from the caller object
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code is doing and why:
arr = [1, 2, 1]
arr.sum
```
<details>
<summary>Explanation:</summary>
`Array#sum` is called on the caller object `arr`. `Array#sum` returns an Integer object, representing the sum of all the elements from the caller object. In this case, `arr.sum` will return `4` (`1` + `2` + `1`).
</details>

---

### *Array#count { |element| ...}*
<details>
<summary>Description:</summary>
`Array#count` when given no argument or block, will return an Integer representing the number of elements in the caller. </br>
When given an argument and no block, will return an Integer representing the number of elements from the caller that are equal in value to the argument passed. </br>
When given only a block with each element from the caller object, will return an Integer representing the number of elements from the caller whose respective block returns a truthy value.
</details>

<b>Practice Example #1:</b>
```ruby
# Explain what this code is doing and why:
arr = [1, 2, 2, 3, 4, 3, 2]
arr.count(2)
```
<details>
<summary>Explanation:</summary>
`Array#count` is called on the caller object `arr` and passed a referecne to the Integer, `2`, as an argument. `Array#count` when given an argument, will return an Integer representing the number of elements from the caller that are equal in value to the argument passed.
In this example, `arr.count(2)` will return `3`, because there are 3 elements of the caller that are equal to the argument passed to `count` (`2`).
</details>

<b>Practice Example #2:</b>
```ruby
# Explain what this code is doing and why:
arr = [1, 2, 2, 3, 4, 3, 2]
arr.count { |el|  el.odd? }
```
<details>
<summary>Explanation:</summary>
`Array#count` is called on the caller object `arr` and passed a block with a block parameter of `el` which will bind to the element currently being iterated over in the caller. `Array#count` when given a block with each element of the caller, will return an Integer representing the number of elements from the caller whose respective block returns a truthy value.
For each iteration of the block passed to count, `el.odd?` is executed, practically, this will return `true` if the current element being iterated over (`el`) is an odd number, otherwise it returns `false`. The returned value from `el.odd?` is then implicitly returned from the block. In this example, `arr.count` will return `3` because there are 3 elements in `arr` that are odd Integers.
</details>

---

### *Array#uniq! { |element| ...}*

<details>
<summary>Description:</summary>
`Array#uniq!` when given no block, will mutate the caller to an Array of elements from the caller but, without any duplicate elements. </br>
When given a block with each element from the caller, will mutate the caller to an Array of the first elements from the caller whose respective block's return a unique value. This means there'll be no two elements whose respective blocks returned a duplicate value in the caller. </br>
`Array#uniq!` returns the caller object.
</details>

<b>Practice Example #1:</b>
```ruby
# Explain what this code is doing and why:
arr = [0, 1, 0, 0, 1, 1, 2, 2, 3]
arr.uniq
```
<details>
<summary>Explanation:</summary>
`Array#uniq!` is invoked on the caller object `arr`. `Array#uniq!` mutates the caller to an Array of elements from the caller but, without any duplicate elements. This will result in `arr.uniq!` mutating `arr` to reference `[0, 1, 2, 3]`.
</details>

<b>Practice Example #2:</b>
```ruby
# Explain what this code is doing and why:
arr = ['a', 'b', 'ab', 'ac', 'abc', 'def']
arr.uniq! { |str| str.size }
```
<details>
<summary>Explanation:</summary>
`Array#uniq!` is invoked on the caller object `arr` and passed a block with a block parameter of `str`, which will bind to the element currently being iterated over in the caller. `Array#uniq!` when given a block will mutate the caller to an Array of the first elements from the caller whose respective block's return a unique value. This means there will be no two elements in the Array whose block's returned values are duplicates. For each iteration of the block `str.size` is executed, returning the character length of `str`. This return value is then implicitly returned for each iteration of the block. This will result in `arr.uniq!` mutating `arr` to `['a', 'ab', 'abc']`.
</details>

---

### *Array#each_with_index { |element, index| ...}*

<details>
<summary>Description:</summary>
`Array#each_with_index` when given a block with each element and its index offeset from the caller, will return the caller object with no regards for the return values of the block.
</details>

<b>Practice Example #1:</b>
```ruby
# Explain what this code output and why:
arr = [5, :a, 'hi']
arr.each_with_index { |e, i| puts "Element: #{e} ; Index: #{i}" }
```
<details>
<summary>Explanation:</summary>
`Array#each_with_index` is invoked on the caller object `arr` and passed a block with block parameters `e` and `i`, which will bind to the element and its index (respectively) that are being iterated over. `Array#each_with_index` returns the caller object with no regard for the return values of the block. For each block iteration `puts "Element: #{e} ; Index: #{i}"` is invoked. This will result in outputs of: </br>
`Element: 5 ; Index: 0`</br>
`Element: a ; Index: 1`</br>
`Element: hi ; Index: 2`</br>
</details>

<br>

## 📖 Hash Methods 📖

### *Hash#each* / *Hash#each_pair {|key, value| ...}*
<details>
<summary>Description:</summary>
`Hash#each` when given a block with each key-value pair, will return the caller Hash. `each` does not use the return values of the block. `Hash#each` can also be given a block with only a 2 element Array of key and value of each key-value pair from the caller (This is if only 1 block parameter is defined).
</details>

<b>Practice Example #1:</b>
```ruby
# Explain what this code is doing and why:
hsh = {:a => 1, :b => 2, :c => 3} 
hsh.each { |kv| p kv }
```
<details>
<summary>Explanation:</summary>
`each` is invoked on the caller object `hsh` and passed a block with a block parameter of `kv` that'll bind to an Array of two elements; a key and a value, from the current key-value pair being iterated over in `hsh`. `each` will return the original caller object and does not consider the returned value of the block. For each block iteration `p kv` is executed, returning and outputting the value of `kv`. This will result in returned and outputted values of: `[:a, 1]`, `[:b, 2]` and `[:c, 3]`.
</details>

<b>Practice Example #2:</b>
```ruby
# Explain what this code is doing and why:
hsh = {:a => 1, :b => 2, :c => 3} 
hsh.each { |k, v| puts "Key: #{k} ; Value: #{v}" }
```
<details>
<summary>Explanation:</summary>
`each` is invoked on the caller object `hsh` and passed a block with a block parameters of `k` and `v` each will bind to the key and the value, from the current key-value pair being iterated over in `hsh`, respectively. `each` will return the original caller object and does not consider the returned value of the block. For each block iteration `puts "Key: #{k} ; Value: #{v}"` is executed, this'll result in these outputs to the terminal: </br>
`Key: :a ; Value: 1` </br>
`Key: :b ; Value: 2` </br>
`Key: :c ; Value: 3` </br>
</details>
---

### *Hash#keys*
<details>
<summary>Description:</summary>
`Hash#keys` will return a new Array of all the keys from the caller object.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code returns and why:
hsh = {:a => 1, :b => 2, :c => 3} 
hsh.keys
```
<details>
<summary>Explanation:</summary>
`keys` is invoked on the caller object `hsh`. `keys` returns a new Array of all the keys from the caller object. This will result in an array of, `[:a, :b, :c]`, being returned.
</details>

---

### *Hash#values*
<details>
<summary>Description:</summary>
`Hash#values` will return a new Array of all the values from the caller object.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code returns and why:
hsh = {:a => 1, :b => 2, :c => 3} 
hsh.values
```
<details>
<summary>Explanation:</summary>
`values` is invoked on the caller object `hsh`. `values` returns a new Array of all the values from the caller object. This will result in an array of, `[1, 2, 3]`, being returned.
</details>

---

### *Hash#key?* / *Hash#has_key?(k)*
<details>
<summary>Description:</summary>
`Hash#key?` will return `true` if any key from the caller object is equal to the argument, otherwise `false` is returned.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code returns and why:
hsh = {:a => 1, :b => 2, :c => 3} 
hsh.key?(:d)
```
<details>
<summary>Explanation:</summary>
`key?` is invoked on the caller object `hsh` and passed a reference to the symbol `:d` as an argument. `key?` returns `true` if any key from the caller is equal to the argument passed. In this case there is no key of `:d` in `hsh` so `key?` returns `false`. 
</details>

---

### *Hash#value?* / *Hash#has_value?(k)*
<details>
<summary>Description:</summary>
`Hash#value?` will return `true` if any value from the caller object is equal to the argument, otherwise `false` is returned.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code returns and why:
hsh = {:a => 1, :b => 2, :c => 3} 
hsh.value?(2)
```
<details>
<summary>Explanation:</summary>
`value?` is invoked on the caller object `hsh` and passed a reference to the Integer `2` as an argument. `value?` returns `true` if any value from the caller is equal to the argument passed. In this case there is value of `2` in `hsh` so `value?` returns `true`. 
</details>

---

### *Hash#select* / *Hash#filter {|k, v| ...}*
<details>
<summary>Description:</summary>
`Hash#select` given a block with each key and value pair from caller, will return a new Hash with key-value pairs whose respective blocks return a truthy value.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code returns and why:
hsh = {:a => 1, :b => 2, :c => 3, :d => 4} 
hsh.select { |k, v| v.odd? }
```
<details>
<summary>Explanation:</summary>
`select` is invoked on the caller object `hsh` and passed a block with block parameters of `k` and `v`, which will bind to the key and value of each key-value pair currently being iterated over in `hsh`. `Hash#select` when given a block will return a new Hash with key-value pairs from the caller whose respective blocks return a truthy value. In each block iteration `v.odd?` is executed, practically, this returns `true` if the value of `v` (the value of the key-value being iterated over) is an odd number. The returned value from `v.odd?` is then implicitly returned from each block, resulting in `select` returning a new Hash of `{:a => 1, :c => 3}`.
</details>

---

### *Hash#select!* / *Hash#filter! {|k, v| ...}*
<details>
<summary>Description:</summary>
`Hash#select` given a block with each key and value pair from caller, will mutate the caller to a Hash with key-value pairs from the caller whose respective blocks return a truthy value.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code returns and why:
hsh = {:a => 1, :b => 2, :c => 3, :d => 4, :e => 5} 
hsh.select! { |k, v| v.even? }
```
<details>
<summary>Explanation:</summary>
`select!` is invoked on the caller object `hsh` and passed a block with block parameters of `k` and `v`, which will bind to the key and value of each key-value pair currently being iterated over in `hsh`. `Hash#select!` when given a block will mutate the caller to a Hash with key-value pairs from the caller whose respective blocks return a truthy value. In each block iteration `v.even?` is executed, practically, this returns `true` if the value of `v` (the value of the key-value being iterated over) is an even number. The returned value from `v.even?` is then implicitly returned from each block, resulting in `select!` returning a new Hash of `{:b => 2, :d => 4}`.
</details>

---

### *Hash#delete(key)*
<details>
<summary>Description:</summary>
`Hash#delete` when given an argument, will remove the key-value pair from the caller, whose key is equal to the argument passed. `Hash#delete` will then return the value of the key-value pair that was removed/deleted. If none of the key's in the caller are equal to the argument, `nil` is returned.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code do and why:
hsh = {:a => 1, :b => 2, :c => 3, :d => 4, :e => 5} 
hsh.delete(:c)
```
<details>
<summary>Explanation:</summary>
`delete` is invoked on the caller object, `hsh`, and is passed a reference to the Symbol `:c` as an argument.
`Hash#delete` when given an argument will remove the key-value pair whose key is equal to the argument passed and return the value of the removed key-value pair. 
In the example, the key-value pair `:c=>3` is removed from the `hsh` Hash. `hsh.delete(:c)` will then return the value of the removed key-value pair, `3`. This results in `hsh` being mutated to a Hash of `{:a => 1, :b => 2, :d => 4, :e => 5} `
</details>

<br>

## 🌐 Enumerable Methods 🌐
> Simply put, Enumerable methods in Ruby can be used on collections, that is, any object that implements an `each` method (Arrays, Ranges, Hashs). There's a lot more to this but for the scope of this lesson you can think of Enumerable methods as more general, and allowing for the ability to be used with different types of collections. </br>
<br>

### *Enumerable#map { |element| ...}*
<details>
<summary>Description:</summary>
`Enumerable#map` when given a block with each element from the caller, will return a new Array populated with the return values from each block iteration. `Enumerable#map` when called on a Hash and given a block with a key and value from each key-value pair from the caller, will return a new Array populated with the return values from each block iteration.
</details>

<b>Practice Example #1:</b>
```ruby
# Explain what this code do and why:
hsh = {:a => 1, :b => 2, :c => 3, :d => 4, :e => 5} 
hsh.map { |kv| kv[1] }
```
<details>
<summary>Explanation:</summary>
`map` is invoked on the caller object `hsh` and passed a block with a block parameter of `kv` which will bind to the current key-value pair being iterated over in `hsh`, represented as a 2 element Array of key and value (`[key, value]`). `Enumerable#map` returns a new Array populated with the return values from each block iteration. For each iteration of the block, the first index of `kv` is implicitly returned from the block. Because `kv` represents a 2 element Array of the current key and value, the first index of `kv` is a reference to the value of the current key-value being iterated over, resulting in `hsh.map` returning a new Array of `[1, 2, 3, 4, 5]`.
</details>

<b>Practice Example #2:</b>
```ruby
# Explain what this code return and why:
hsh = {:a => 1, :b => 2, :c => 3} 
hsh.map { |k, v| [k, v + 10] }.to_h
```
<details>
<summary>Explanation:</summary>
`map` is invoked on the caller object `hsh` and passed a block with block parameters `k` and `v` which will bind to each key and value (respectively) of the key-value currently being iterated over in `hsh`. `Enumerable#map` given a block, will return a new Array populated with return values from each block iteration. For each iteration of the block passed to `hsh.map` an Array of `[k, v + 10]`. Essentially, returning an Array representation of the key-value pair with value incremented by `10`, for each block iteration. This will result in a new Array of `[ [:a, 11], [:b, 12], [:c, 13]]` being returned from `hsh.map`. `to_h` is then invoked on the 2D Array returned by `hsh.map`, returning the Hash equivalent of the 2D Array, `{a: => 11, b: => 12, c: => 13}`.
</details>

<b>Practice Example #3:</b>
```ruby
# Explain what this code do and why:
r = (1..5) 
r.map { |num| num - 1 }
```
<details>
<summary>Explanation:</summary>
`map` is invoked on the caller object `r` and passed a block with a block parameter of `num` which will bind to the current element being iterated over in `r`. `Enumerable#map` returns a new Array populated with the return values from each block iteration. For each iteration of the block, `num - 1` is executed, implictly returning the value of the current element being iterated over (`num`) decremented by 1, from each block iteration. This will result in `r.map` returning a new Array of `[0, 1, 2, 3, 4]`.
</details>

<b>Practice Example #4:</b>
```ruby
# Explain what this code do and why:
hsh = {:a => 1, :b => 2, :c => 3, :d => 4}
hsh.map { |k, v| k.to_s }
```
<details>
<summary>Explanation:</summary>
`map` is invoked on the caller object `hsh` and passed a block with block parameters of `k` and `v` which will bind to the current key and value of the key-value pair being iterated over in `hsh`. `Enumerable#map` returns a new Array populated with the return values from each block iteration. For each iteration of the block, `k.to_s` is executed. Practically, this returns the String representation of the key of the key-value pair currently being iterated over. This value is then implictly returned from each block iteration. This will result in `hsh.map` returning a new Array of `['a', 'b', 'c', 'd']`.
</details>

<br>

## 🔡 String Methods 🔡
> Although Strings are not collections, we still may want to transform Strings into Arrays that can more easily be iterated through or use some of Ruby's built-in magic to iterate over each character in a String. These are worth knowing, and are ones I've ended up using a lot!

### *String#chars*
<details>
<summary>Description:</summary>
`String#chars` returns a new Array where each character of the caller is an element.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code return and why:
str = 'hello world'
str.chars
```
<details>
<summary>Explanation:</summary>
`String#chars` is called on the caller object `str`. `String#chars` returns a new Array, where each character from the caller is an element. This will result in `str.chars` returning a new Aray of `["h","e","l","l","o", " ", "w", "o", "r", "l", "d"]`
</details>

---

### *String#each_char*
<details>
<summary>Description:</summary>
`String#each_chars` when given a block with each character from the caller, returns the caller object with no regard for the return values of the block.
</details>

<b>Practice Example:</b>
```ruby
# Explain what this code output and return? Why?:
str = 'hello'
str.each_char { |char| puts char }
```
<details>
<summary>Explanation:</summary>
`String#each_char` is called on the caller object `str` and passed a block with a block parameter of `char` which will bind to the current character being iterated over in `str`. `String#each_char` returns the caller object with no regard for the return values of the block. For each iteration of the block, `puts char` is invoked, outputting the current value of `char` to the terminal. This will result in an output of: </br>
`h`</br>
`e`</br>
`l`</br>
`l`</br>
`o`</br>
`str.each_char` then returns `str`, `"hello"`.
</details>

<br>
<br>

---

---
 
# Good-to-Knows:
> This next section is what I call *"good-to-knows"*. They aren't 100% necessary, but they will help you out a lot as opposed to writing out certain logic from scratch using just the *"essentials"*.

