require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) - n is the length of the array and the programs runs n times. 
# Space complexity: O(1) because it is asigning and reasigning a new number to the 1 variable (current_index)
def length(array)
  # raise NotImplementedError
  current_index = 0
  while !array[current_index].nil?
    current_index += 1
  end
  return current_index
end

# Prints each integer values in the array
# Time complexity: O(n) - n is the length of the array and the programs runs n times (once for each element).
# Space complexity: O(1) because it is asigning and reasigning a new number to the 1 variable (current_index) and using no memory for the for reporting each value since it is just puts ing them.
def print_array(array)
  # raise NotImplementedError
  current_index = 0
  while !array[current_index].nil?
    puts array[current_index]
    current_index += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) - n is the length of the array and the programs runs n times in the worst senario.
# Space complexity: O(1) - because we only have the local variable of index and it gets reassigned but is constant.
def search(array, length, value_to_find)
  # raise NotImplementedError
  length.times do |index|
    if array[index] == value_to_find
      return true
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) - n is the length of the array and the programs runs n times.
# Space complexity: O(1) - the space used is for the varible max and index and they are constant.
def find_largest(array, length)
  # raise NotImplementedError
  if length == 0
    return nil
  end
  
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
# Time complexity: O(n) - n is the length of the array and the programs runs n times.
# Space complexity: O(1) - the space used is for the varible min and index and they are constant.
def find_smallest(array, length)
  # raise NotImplementedError
  if length == 0
    return nil
  end

  min = array[0]
  length.times do |index|
    if array[index] < min
      min = array[index]
    end
  end
  return min
end

# Reverses the values in the integer array in place
# Time complexity: O(n) - n is the length of the array and the programs runs 1/2 n times but we drop the constant.
# Space complexity: O(1) - the space used is for the varibles first_index and last_index and temp and they are constant. we are not creating a new array, just reassinging new values to the existing elemenets.
def reverse(array, length)
  # raise NotImplementedError
  first_index = 0
  last_index = length - 1
  while first_index < last_index
    temp = array[first_index]
    array[first_index] = array[last_index]
    array[last_index] = temp
    first_index += 1
    last_index -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n) in the binary search we half our data set each time or we are mutiplying it in 1/2 each time and we will end up using very small number of steps to have reviewed all elements in a set.
# Space complexity: O(1) since the space use is constant - we are not creating new arrays. 
def binary_search(array, length, value_to_find)
  # raise NotImplementedError
  if length == 0
    return false
  end
  low_index = 0
  high_index = length - 1
  while low_index <= high_index
    mid_index = (low_index + high_index) / 2
    if array[mid_index] == value_to_find
      return true
    elsif array[mid_index] > value_to_find
      high_index = mid_index - 1
    else 
      low_index = mid_index + 1
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
