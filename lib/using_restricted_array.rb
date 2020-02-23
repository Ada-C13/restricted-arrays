require_relative 'restricted_array.rb'
require 'pry'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil

# Approach:
# Loop through array until nil is encountered, tracking the num of loops
# Then return the counter value

# Complexity:
# Time complexity: O(n)
# Explanation - double the number of inputs doubles the population 
#   therefore, double the amount is filtered till nil is found
# Space complexity: O(1)
# Explanation - no matter input, there will only be one number returned

def length(array)
  count = 0

  until array[count] == nil
    count += 1
  end

  return count
end

# Prints each integer values in the array

# Approach:
# Loop through array until nil is encountered
# During each loop, print out value at current index
# Also track the number of loops through a counter

# Complexity:
# Time complexity: O(n)
# Explanation - double the number of inputs doubles the population 
#   therefore, double the amount is filtered till nil is found
# Space complexity: O(1)
# Explanation - no matter input, there will only be one number returned

def print_array(array)
  count = 0

  until array[count] == nil
    puts array[count]
    count += 1
  end

end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.

# Approach: 
# Loop through array for number of elements in array
# During loop, check if value to find equals value of current index
# If found, return true; if not, return false after loop

# Complexity:
# Time complexity: O(n)
# Explanation - double the number of inputs doubles the population 
#   therefore, double the amount is filtered till nil is found
# Space complexity: O(1)
# Explanation - no matter input, there will only be one number returned

def search(array, length, value_to_find)

  length.times do |index|
    if array[index] == value_to_find
      return true
    end
  end

  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.

# Approach: 
# Start with max value as value of first index in array
# During loop, check if current value is greater than current max value
# If greater, chanage max to current value; if not, move on
# Return the max value after loop is complete

# Complexity:
# Time complexity: O(n)
# Explanation - double the number of inputs doubles the population 
#   therefore, double the amount is filtered till nil is found
# Space complexity: O(1)
# Explanation - no matter input, there will only be one number returned

def find_largest(array, length)
  max = array[0]

  length.times do |index|
    if array[index] > max
      max = array[index]
    end
  end

  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.

# Approach: 
# Start with min value as value of first index in array
# During loop, check if current value is less than current min value
# If less, chanage min to current value; if not, move on
# Return the min value after loop is complete

# Complexity:
# Time complexity: O(n)
# Explanation - double the number of inputs doubles the population 
#   therefore, double the amount is filtered till nil is found
# Space complexity: O(1)
# Explanation - no matter input, there will only be one number returned

def find_smallest(array, length)
  min = array[0]

  length.times do |index|
    if array[index] < min
      min = array[index]
    end
  end

  return min
end

# Reverses the values in the integer array in place

# Approach: 
# Set up first_index to be 0
# Set up last_index to be index of last element in array
# Loop as long as first_index is less than last_index
# During loop, save value of first_index to a temp variable
# Then replace value of first_index with value of last_index
# Then replace value of last_index with value in temp variable
# Increase first_index and decrease last_index by 1
# After loop, return the reversed array

# Complexity:
# Time complexity: O(n)
# Explanation - double the number of inputs doubles the population 
#   therefore, double the amount is filtered till nil is found
# Space complexity: O(1)
# Explanation - no matter input, there will only be one number returned

def reverse(array, length)
  first_index = 0
  last_index = length - 1

  while first_index < last_index
    temp = array[first_index]
    array[first_index] = array[last_index]
    array[last_index] = temp

    first_index += 1
    last_index -= 1
  end

  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.

# Approach: 
# Set up mid search points and values
# Continue loop until value found or the counter is greater than length
# During loop, reassign mid points based on whether value to find
#   is greater or less than mid points
# return true/false based on if mid value is the value to find

# Complexity:
# Time complexity: O(log n)
# Explanation - cuts population in half during each loop
#   therefore, adding in twice the input will only increase work by 1
# Space complexity: O(1)
# Explanation - no matter input, there will only be one number returned

def binary_search(array, length, value_to_find)
  mid_point = length/2
  mid = array[mid_point]
  counter = 0

  until mid == value_to_find || counter > length
    if mid > value_to_find
      mid_point = mid_point/2
    else 
      mid_point = (length - mid_point)/2 + mid_point
    end

    mid = array[mid_point]
    counter += 1
  end

  mid == value_to_find
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
