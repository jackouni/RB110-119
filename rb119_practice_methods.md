# <ins>RB119 Methods Study Guide</ins>
The methods in this study guide are methods that may be helpful in mastery of RB110 and RB119 material.

## Format for explaining:
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
      - *"... If a block returns a truthy/falsy value, [ 'the current element being iterated over is returned' / 'the current element being iterated over is added to the new array' / 'the method returns `True/False`' ]"*

3. **What's happening in each block iteration?:**
    1. *"Each iteration of the block will do `x, y, and z"*
    2. If it does something with the return value: </br>
    - *"`value` is returned from the block and `used in this way`"*
4. **What's returned?:**

#### Caveat:
> This is just a rough guideline, there are times where you can't follow this guide to a 'T' and that's okay. You will also have to find a way to explain/incorporate the relevance and use of the argument(s) (if any) in your explanations.

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
`map` is invoked on the caller object `arr` and passed a block with a block parameter of `num` that'll bind to the current element being iterated over in `arr`. `map` returns a new Array whose elements are the returned values from each block iteration. Each iteration of the block will return the value of `num + 1`, resulting in a new Array of `[2, 3, 4, 5]` being returned from `map`.
</details>
