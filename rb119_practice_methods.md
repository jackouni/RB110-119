# <ins>RB119 Methods Study Guide</ins>
The methods in this study guide are methods that may be helpful in mastery of RB110 and RB119 material.

## Format for explaining:
The framework I follow for explaining iterative methods is this:
1. **Explain what is happening:**
  1. State what method is being called and on what caller object: *"`#some_method` is invoked on the caller object `caller_obj`..."*
  2. State what argument is being passed: *"... and is passed a reference to the `value` as an argument ..."*
  3. Explain the block: *"...is passed a block with a block parameter of `parameter` that'll bind to the current element being iterated over in `caller`."*
2. **Explain what the method does:**
  1. What is returns
  2. If/how it uses the return values from blocks.
3. **What's happening in each block iteration:**

## Essentials:

### *Array#map*
<details>
<summary>Description:</summary>
Array#map when given a block with each element from the caller, will return a new Array populated with the returned values from each block iteration. 
</details>

<b>Practice Example:</b>
```ruby
# Explain what is returned from this code and why:
a = [1, 2, 3, 4]
a.map { |num| num + 1}
```
<details>
<summary>Answer/Solution:</summary>
`map` is invoked on the caller object `a` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `a`. `map` returns a new Array whose elements are the returned values from each block iteration. Each iteration of the block will return the value of `num + 1`, resulting in a new Array of `[2, 3, 4, 5]` being returned from `map`.
</details>
