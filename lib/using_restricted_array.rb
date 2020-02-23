require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) n being the length
# Space complexity: O(1)
def length(array)
  i = 0
  while array[i] != nil do
    i += 1
  end
  return i
end

# Prints each integer values in the array
# Time complexity: 0(n) n being the length
# Space complexity: 0(1)
def print_array(array)
  i = 0
  while array[i] != nil do
    print array[i]
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: 0(n) n being the length
# Space complexity: 0(1)
def search(array, length, value_to_find)
  return nil if length == 0
  i = 0
  while i < length do
    if array[i] == value_to_find
      return true
    end
    i += 1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: 0(n) n being the length
# Space complexity: 0(1)
def find_largest(array, length)
  return nil if length == 0
  i = 0
  max = array[0]
  while i < length do
    if array[i] > max
      max = array[i]
    end
    i += 1
  end
  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: 0(n) n being the length
# Space complexity: 0(1)
def find_smallest(array, length)
  return nil if length == 0
  i = 0
  min = array[0]
  while i < length do
    if min > array[i]
      min = array[i]
    end
    i += 1
  end
  return min
end

# Reverses the values in the integer array in place
# Time complexity: ?
# Space complexity: ?
def reverse(array, length)
  # raise NotImplementedError if length == 0
  first_index = 0
  last_index = length - 1
  while first_index < last_index
    tamp = array[first_index]
    array[first_index] = array[last_index]
    array[last_index] = tamp
    first_index += 1
    last_index -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: 
# Space complexity: ?
def binary_search(array, length, value_to_find)
  # return nil if length < 1
  low = 0
  high = length - 1
  while low < high 
    mid = (low + high)/2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    elsif array[mid] < value_to_find
      low = mid + 1
    end
  end

  if array[low] == value_to_find
    return true
  else
    return false
  end
end

# Algorithm steps:
# While low is smaller than high;
# mid is an index set to the middle element in the array 
# (mid = (low + high)/2)
# Compare value at index mid with value to find.
# If equal, return true.
# If value at index mid is higher,
# Eliminate second half. Set high = mid - 1
# If value at index mid is lower,
# Eliminate first half. Set low = mid + 1
# If value at low is the value to find, return true.
# Return false.
# #######################################################################
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
