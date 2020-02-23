require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# 1. Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil

# Time complexity: O(n) => Because it loops through depending on the input size (array size)
# Space complexity: O(1)
def length(array) 
  size = 0

  while array[size] != nil 
    size += 1  
  end 

  return size 
end


# 2. Prints each integer values in the array

# Time complexity: O(n) => Because it loops through depending on the input size (array size)
# Space complexity: O(1)
def print_array(array) 
  i = 0

  while array[i] != nil 
    print array[i]
    print " "
    i += 1
  end 
  puts
end


# 3. For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.

# Time complexity: O(n) => Because it loops through depending on the input size (array size)
# Space complexity: O(1)
def search(array, length, value_to_find)

  # edge case
  return false if length == 0

  i = 0
  while i < length 
    return true if array[i] == value_to_find 
    i += 1
  end 

  return false
end


# 4. Finds and returns the largest integer value the array
# Assumes that the array is not sorted.

# Time complexity: O(n) - linear search => Because it loops through depending on the input size (array size)
# Space complexity: O(1)
def find_largest(array, length)
  # edge case 
  return nil if length == 0

  i = 1 
  max = array[0]

  while i < length 
    max = array[i] if array[i] > max  
    i += 1
  end 

  return max
end


# 5. Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.

# Time complexity: O(n) - linear search => Because it loops through depending on the input size (array size)
# Space complexity: O(1)
def find_smallest(array, length)
  # edge case
  return nil if length == 0 

  i = 1 
  min = array[0]

  while i < length 
    min = array[i] if array[i] < min
    i += 1
  end 

  return min
end


# 6. Reverses the values in the integer array in place
# *in plance: it means "not using extra memory"

# Time complexity: O(n) => Because it is a n/2 of the loop and it drops the constants (2)
# Space complexity: O(1) => Because you just modified the original array
def reverse(array, length)
  i = 0 
  j = length - 1

  while i < j 
    temp = array[i]
    array[i] = array[j]
    array[j] = temp

    i += 1 
    j -= 1
  end 

  return array
end


# 7. For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n) => Because after each iteration, half of the remaining elements are eliminated
# Space complexity: O(1)
def binary_search(array, length, value_to_find)
  # edge case 
  return nil if length == 0 

  # "low, high, mid" indicate index
  low =  0
  high = length - 1

  # it's important to include "equal to (=)" comparison to check the last element of the array
  while low <= high  
    mid = (low + high) / 2

    if value_to_find == array[mid]
      return true
    elsif value_to_find < array[mid]
      # eliminate the right half of the array 
      high = mid - 1 
    elsif value_to_find > array[mid]
      # elimiate the left half of the array 
      low = mid + 1  # low = 2
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
