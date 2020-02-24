require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n), only looping over structure once 
# Space complexity: O(1), no additional storage space needed
def length(array)
  index = 0
  length = 0
  while array[index] != nil
    length += 1
    index +=1 
  end 
  return length
end

# Prints each integer values in the array
# Time complexity: O(n), loops through structure once
# Space complexity: O(1), no additional storage space needed
def print_array(array)
  counter = 0
  while array[counter] != nil
    puts array[counter]
    counter += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n), loops through structure only once
# Space complexity: O(1), no additional structures created
def search(array, length, value_to_find)
  index = 0
  while array[index] != nil 
    if array[index] == value_to_find
      return true
    else
      index +=1
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n), loops through structure only once
# Space complexity: O(1), no additional structures created
def find_largest(array, length)
  largest = 0
  length.times do |index|
    if array[index] > array[largest]
      largest = index
    end
  end
  return array[largest] 
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n), loops through structure only once
# Space complexity: O(1), no additional structures created
def find_smallest(array, length)
  smallest = 0
  length.times do |index|
    if array[index] < array[smallest]
      smallest = index
    end
  end
  return array[smallest]
end

# Reverses the values in the integer array in place
# Time complexity: O(n), loops through the structure half the times of its size
# Space complexity: O(1), no additional structures created
def reverse(array, length)
  left = 0
  right = length-1
  while left < right do 
    temp = array[left]
    array[left] = array[right]
    array[right] = temp
    left += 1
    right -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n) because worst case scenario we have to do full n number of iterations but array size is halved each iteration
# Space complexity: O(1), no additional data structures creatured 
def binary_search(array, length, value_to_find)
  left_marker = 0
  right_marker = length-1
  pivot = length/2
  while left_marker <= right_marker 
    if array[pivot] == value_to_find
      return true
    elsif array[pivot] < value_to_find #value is somewhere on the right
      left_marker = pivot + 1
      pivot = (left_marker + right_marker) / 2
    else #value is somewhere on the left
      right_marker = pivot - 1
      pivot = (left_marker + right_marker) / 2
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
