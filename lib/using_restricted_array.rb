require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) because we will need to loop through the whole array each time
# Space complexity: O(1) because no additional memory is required because no copy is made
def length(array)
  my_integer_array_length = 0
  while array[my_integer_array_length] != nil
    my_integer_array_length += 1
  end
  return my_integer_array_length
end

# Prints each integer values in the array
# Time complexity: O(n) because we will need to loop through the whole array each time
# Space complexity: O(1) because no additional memory is required because no copy is made
def print_array(array)
  index = 0
  while array[index] != nil
    p array[index]
    index += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) because, worst case scenerio, we need to loop through the whole array each time
# Space complexity: O(1) because no additional memory is required because no copy is made
def search(array, length, value_to_find)
  index = 0
  until index == length
    if array[index] == value_to_find
      return true
      exit
    else index += 1
    end
  end
  
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) because we need to loop through the whole array each time because all numbers need to be checked
# Space complexity: O(1) because no additional memory is required because no copy is made
def find_largest(array, length)
  largest_number = array[0]
  if largest_number
    length.times do |index|
      if array[index] > largest_number
        largest_number = array[index]
      end
    end
    return largest_number
  end
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n) because we need to loop through the whole array each time because all numbers need to be checked
# Space complexity: O(1) because no additional memory is required because no copy is made
def find_smallest(array, length)
  smallest_number = array[0]
  if smallest_number
    length.times do |index|
      if array[index] < smallest_number
        smallest_number = array[index]
      end
    end
    return smallest_number
  end
end

# Reverses the values in the integer array in place
# Time complexity: O(n) because we need to loop through the whole array each time because all numbers need to be checked
# Space complexity: O(1) because no additional memory is required because no copy is made, the array is reversed in place
def reverse(array, length)

  index = 0
  length = length - 1

  while index < length
    holding = array[index]
    array[index] = array[length]
    array[length] = holding

    index += 1
    length -= 1
  end

  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: best case efficiency of O(1) and worst case (average case) efficiency of O(log n)
# Space complexity: O(1) because no additional memory is required because no copy is made
def binary_search(array, length, value_to_find)
  min_point = array[0]
  max_point = length - 1
  mid_point = length/2
  
  while min_point <= max_point
    mid_point = (max_point + min_point) / 2

    if array[mid_point] == value_to_find
      return true
    elsif mid_point < value_to_find
      min_point = mid_point + 1
    elsif mid_point > value_to_find
      max_point = mid_point - 1
    end
  end

  return false

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
