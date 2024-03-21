# <ins>RB119 Methods Study Guide</ins>
The methods in this study guide are methods that may be helpful in mastery of RB110 and RB119 material.

## Format for explaining iterative methods:
The framework I follow for explaining iterative methods with blocks is this:
1. **Explain what is happening:**
    1. State what method is being called and on what caller object:</br> 
    - *"`#some_method` is invoked on the caller object `caller_obj`..."*
    2. State what argument is being passed:</br> 
    - *"... and is passed a reference to `value` as an argument ..."*
    3. Explain the block: </br>
    - *"...is then passed a block with block parameter(s), `parameters`... that'll bind to `element_or_obj`."*

2. **Explain what the method does:**
    1. What the method returns:</br>
      - *"... returns [ 'the calling object' / 'a new array' / 'a new hash' / 'a boolean' ] "*
    2. If/How it uses the return values from blocks:</br>
      - *"... with no regard to the return value of each block"*</br>
      - *"... and adds the return value of each block to the new Array/Hash"*</br>
      - *"... each element being iterated over is mutated to the corresponding block's returned value"* </br>
      - *"... If a block returns a truthy/falsy value, [ 'the current element being iterated over is returned' / 'the current element being iterated over is added to the new array' / 'the method returns `True/False`' /  'the element being iterated over is removed from the caller' ]"*

3. **What's happening in each block iteration?:**
    1. *"Each iteration of the block will do `x, y, and z"*
    2. If it does something with the return value: </br>
    - *"`value` is returned from the block and `used in this way`"*
4. **What's returned?:**

#### Caveat:
> This is just a rough guideline, there are times where you can't follow this guide to a 'T' and that's okay. You will also have to find a way to explain/incorporate the relevance and use of the argument(s) (if any) in your explanations. Some of this stuff you can omit as well, this depends on what the question is asking and the level of precision that is being asked of you. This is just somewhere to start so you can find your own flavour of explaining code.

---
---

## Essentials:

### *Array#each*
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
<summary>Answer/Solution:</summary>
`each` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `each` returns a the original caller object, with no regards for the returned values from the block. Each iteration of the block will invoke `puts num`, resulting in '1', '2', '3', and '4' being outputted the terminal. The original calling object is then returned.
</details>

---

### *Array#map*
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
<summary>Answer/Solution:</summary>
`map` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `map` returns a new Array whose elements are the returned values from each block iteration. Each iteration of the block will return the value of `num + 1`, resulting in a new Array of `[2, 3, 4, 5]` being returned from `map`.
</details>

---

### *Array#select* / *Array#filter*
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
<summary>Answer/Solution:</summary>
`select` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `select` returns a new Array with elements from the caller whose respective blocks return a truthy value. Each iteration of the block will invoke `odd?` on the current element being iterated over and if the current element is an odd Integer, `odd?` returns `true`. This will result in `select` returning a new Array of `[1, 3]`.
</details>

---

### *Array#all?*
<details>
<summary>Description:</summary>
`Array#all?(arg) { |element| ...}` when given an `arg` will return `true` if every `element` from the caller is equal to `arg`, otherwise `false` is returned. When given no argument and a block with each `element` from the caller, will return `true` if **all** blocks return a truthy value, otherwise `false` is returned.
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
arr = [1, 2, 3, 4]
arr.all? { |num| num < 5 }
```
<details>
<summary>Answer/Solution:</summary>
`all?` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `all?` returns `true` if **all** blocks return a truthy value, otherwise it returns `false`. Each iteration of the block will evaluate the expression, `num < 5`. Because every element in the calling Array is less than `5`, every block returns `true` resulting in `all?` returning `true`.
</details>

---

### *Array#any?*
<details>
<summary>Description:</summary>
`Array#any?(arg) { |element| ...}` when given an `arg` will return `true` if any `element` from the caller is equal to `arg`, otherwise `false` is returned. When given no argument and a block with each `element` from the caller, will return `true` if **any** blocks return a truthy value, otherwise `false` is returned.
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
arr = [1, 2, 3, 4]
arr.any? { |num| num > 3 }
```
<details>
<summary>Answer/Solution:</summary>
`any?` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `any?` returns `true` if **any** block returns a truthy value, otherwise it returns `false`. Each iteration of the block will evaluate the expression, `num > 3`. Because the last element of `arr`, `4`, is greater than `3`, `true` is returned for that block resulting in `any?` returning `true`.
</details>

---

### *Array#sort*
<details>
<summary>Description:</summary>
`Array#sort { |pair1, pair2| ...}` 
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
arr = [1, 3, 5, 4, 2]
arr.sort
```
<details>
<summary>Answer/Solution:</summary>
`sort` is invoked on the caller object `arr`. `sort`, when given no block, returns a new Array with elements from the caller sorted by value from least to greatest. In this example, `sort` will return a new Array of `[1, 2, 3, 4, 5]`.
</details>