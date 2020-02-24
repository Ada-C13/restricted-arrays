# frozen_string_literal: true

require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: 0(n)
# Space complexity: 0(1)
def length(array)
  raise NotImplementedError
  i = 0
  i += 1 until array[i].nil?
  i
end
length(array)

def length(array)
  i = 0
  i += 1 until array[i].nil?
  i
end
length(array)

# Prints each integer values in the array
## Time complexity: 0(n)
# Space complexity: 0(1)

def print_array(array)
  raise NotImplementedError
  print_string = (array[0]).to_s
  i = 1
  until array[i].nil?
    i += 1
    print_string += " #{array[i]}"
  end
end
print_array(array)
  # For an unsorted array, searches for 'value_to_find'.
  # Returns true if found, false otherwise.
 # Time complexity: 0(n)
# Space complexity: 0(1)
  def search(array, length, value_to_find)
    length.times do |i|
      return true if array[i] == value_to_find
    end
    false
  end

  # Finds and returns the largest integer value the array
  # Assumes that the array is not sorted.
  # Time complexity: 0(n)
  # Space complexity: 0(1)

def find_largest(array, length)
  raise NotImplementedError
  largest_value = array[0]
  (length - 1).times do |i|
    largest_value = array[i + 1] if array[i + 1] > largest_value
  end
    largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: 0(n)
# Space complexity: 0(1)
def find_smallest(array, length)
  raise NotImplementedError
  smallest_value = array[0]
  (length - 1).times do |i|
  smallest_value = array[i + 1] if array[i + 1] < smallest_value
  end
end


# Reverses the values in the integer array in place
# Time complexity: 0(n)
# Space complexity: 0(1)
def reverse(_array, _length)
  raise NotImplementedError
    first = 0
    last = array.length - 1

    while first < last
      temp_array = array[first]
      array[first] = array[last]
      array[last] = temp_array
      first +=1
      last += 1
    end
end
  puts reverse(array)
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?? it will take longer 
# Space complexity: 0(1)
def binary_search(_array, _length, _value_to_find)
  raise NotImplementedError low = 0
  high = length - 1
  while low <= high
    mid = (low + high) / 2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    else array[mid] < value_to_find
         low = mid + 1
    end
  end
  false
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
    temp_index = index + 1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index]
        min_index = temp_index
      end # found a new minimum, update min_index
      temp_index += 1 # move to next index
    end
    unless min_index != index
      next
    end # next minimum value is not at current index, swap

    temp = array[min_index]
    array[min_index] = array[index]
    array[index] = temp
  end
end
## --- END OF METHODS ---
