## QUESTION 1:
Given a String as an argument, return an Array of all consecutive numbers from the String.
Consecutive numbers being: a series of numbers containing no other non-numeric characters.
Consecutive numbers must be larger than 1 digit, otherwise do not add these to the returned array.
Note: Spaces DO NOT break a series of numbers

Example/Test Cases:
```ruby
p numbers_from_string('abc123abc') == [123]
p numbers_from_string('11abc1!23abc') == [11, 23]
p numbers_from_string('hello world!') == []
p numbers_from_string('Ruby3.32') == [32]
p numbers_from_string('1 2 3 4') == [1234]
p numbers_from_string('12abc7f24ghi1678!') == [12, 24, 1678]

# All test cases should return `true`
```
---
## QUESTION 2:
We've been working with a really weird way of keeping records of our students. Right now we're using an Array of subarrays, each representing a student. Each subarray contains its' own subarrays that each have 2 elements: The information type and the value/data for that information type. This is what our format currently looks like:
```ruby
students = [
  [["name", "mike"],   [:age, 24],  ["grade", "97%"],        ["Passed?", :true]],
  [["name", "luKe"],   [:age, 30],  ["grade", "67 percent"], ["Passed?", false]],
  [["name", "Karen"],  [:age, 27],  ["grade", "88 pERcent"], ["Passed?", "true"]],
  [["name", "Ralph"],  [:age, 27],  ["grade", "81"],         ["Passed?", "true"]],
  [["name", "bryAn"],  ["age", 28], ["grade", "91 percent"], ["Passed?", true]]
]
```
Not to mention all the other typos and formatting issues with our current data structure 😳... </br>
We want to convert this information into something cleaner and without the typos, and with each student getting a student id made up of the first 3 letters of their name followed by their age.
Create a method that converts our old Array of students and their information into a new Hash like this:
```ruby
convert_old_format(students) == {
                                  "Mike" => {
                                    :age     => 24,
                                    :grade   => 97,
                                    :passed? => true,
                                    :id      => "Mik24"
                                  },
                                  "Luke" => {
                                    :age     => 30,
                                    :grade   => 67,
                                    :passed? => false,
                                    :id      => "Luk30"

                                  },
                                  "Karen" => {
                                    :age     => 27,
                                    :grade   => 88,
                                    :passed? => true,
                                    :id      => "Kar27"
                                  },
                                  "Ralph" => {
                                    :age     => 27,
                                    :grade   => 81,
                                    :passed? => true,
                                    :id      => "Ral27"
                                  },
                                  "Bryan" => {
                                    :age     => 28,
                                    :grade   => 91,
                                    :passed? => true,
                                    :id      => "Bry28"
                                  },
                                  "Craig" => {
                                    :age     => 26,
                                    :grade   => 9,
                                    :passed? => false,
                                    :id      => "Cra26"
                                  }
                                }

# Test case should return `true`
```
---
## QUESTION 3:
Create a method that takes a String and mutates it in place to have each of it's characters swapped with the character on the opposite end/side of the String. For example:
"abcde" would be converted into "edcba", as 'a' swaps with 'e', 'b' swaps with 'd', because 'c' is the center it doesn't swap with anything.

---
## QUESTION 4:
Implement function that finds all fibonacci slices in a given array of integers. 
A Fibonacci slice is a sequence where every number after the first two is the 
sum of the two preceding ones. The minimum length is 3.
```ruby
# Example Test Cases (All should return `true`)
puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]) == [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]

puts find_fibonacci_slices([2, 4, 7, 11, 18]) == [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]

puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]) == [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]

puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]) == [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]

puts find_fibonacci_slices([10, 22, 33, 43, 56]) == []
```
---
## QUESTION 5:
Given two words, how many letters do you have to remove from them to make them anagrams?

```ruby
anagram_difference('', '') == 0
anagram_difference('a', '') == 1
anagram_difference('', 'a') == 1
anagram_difference('ab', 'a') == 1
anagram_difference('ab', 'ba') == 0 
anagram_difference('ab', 'cd') == 4
anagram_difference('aab', 'a') == 2 
anagram_difference('a', 'aab') == 2 
anagram_difference('codewars', 'hackerrank') == 10 
anagram_difference("oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau", "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw") == 42
anagram_difference("fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo", "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt") == 50
```
---
## QUESTION 6:
We want to mutate a string according to a code. In this code, given the command `"9a"`, 
we should change the character at index 9 of the string to `"a"`.

Write a method that takes a string and a list of these commands, and mutates the string accordingly.

```ruby
# Test cases return true
test_1 = "dog"
p encode!(test_1, ["0f"])
p test_1 == "fog"

test_2 = "parrot"
p encode!(test_2, ["0m", "3m", "8m"])
p test_2 == "marmot"

test_3 = "weimaraner"
p encode!(test_3, ["0p", "2t", "3p", "6t"])
p test_3 == "petpartner"

test_4 = "incorrect long strung"
p encode!(test_4, ["0a", "1 ", "18i"])
test_4 == "a correct long string"
```
---
## QUESTION 7:
Implement the function/method, minimum shorten. The function shortens a sentence such that it will fit within the character limit set. 
It shortens by removing vowels in the sequence of a, e, i, o, and u. 
Start removing from the end of the sentence. If it can not be shortened to fit within character limit, 
return an empty string. Spaces don’t count for the limit.

```ruby
p minimum_shorten("This is a test sentence", 18) # This is  test sentence
# This is  test sentence
p minimum_shorten("Hello World", 8) # Hllo Wrld
# Hello Wrld (11) Hllo Wrld 
p minimum_shorten("Short", 10) # Short
# Short (10)
p minimum_shorten("A very long sentence with many vowels", 10) # ""
#
```
---
## QUESTION 8:
Given 2 two arguments of an array of numbers and a number, 
find all the pairs that results in the forming a triangle with the number.

In order to form a valid triangle, the sum of the two shorter sides of the triangle must be greater than the largest side of the triangle.
```ruby
puts find_triangle_pairs([2, 3, 4, 5], 7).inspect # [ [ 3, 5 ], [ 4, 5 ] ]
# [2, 3, 4, 5], 7 --> [3, 5], [4, 5]
puts find_triangle_pairs([1, 2, 3, 4], 10).inspect # []
# []
puts find_triangle_pairs([7, 10, 12, 15], 9).inspect # [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
# 
puts find_triangle_pairs([8, 2, 5, 6, 3], 4).inspect # [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]
```
## QUESTION 9:
Implement a function, capitalize, that capitalizes all words in a sentence. However, only capitalize if the word is followed by a word starting with a vowel (for Ruby don’t use capitalize).
```ruby
p capitalize("hello apple world") == "Hello apple world"
p capitalize("this is an umbrella") == "This Is An umbrella"
p capitalize("every vowel starts an echo") == "every vowel Starts An echo"
p capitalize("under the oak tree") == "under The oak tree"
p capitalize("a quick brown fox") == "a quick brown fox"
```
## QUESTION 10:
Given a string, write a method/function which returns the number of 
characters present in the largest palindrome substring. Palindromes are
case-insensitive and are at least 2 characters long. If no palindromes
are present, return -1. 
```ruby
p all_contiguous_subarrays("supertacocat") #== 7
p all_contiguous_subarrays("MomAndDad") #== 3
p all_contiguous_subarrays("Palindrome") #== -1
```