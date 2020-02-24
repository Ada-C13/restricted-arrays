require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) -> n is each element in the array, if the array increase the time complexity increase too. 
# Space complexity: o(1) -> Constant, if the array grow the varibles will be the same. 
def length(array)
  length = 0

  while (array[length] != nil)
    length += 1
  end
  return length
  # raise NotImplementedError
end

# Prints each integer values in the array
# Time complexity: O(n) -> n is each element in the array - The time increase if the array grow.
# Space complexity: O(1) -> Contant, the same variables even if the array increased.
def print_array(array)
  length = 0
  while array[length] != nil
    length += 1
  end

  length.times do |index|
    p array[index]
  end  
  # raise NotImplementedError
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) -> For each elemet in the array, increase the time based on n: Number of elements in the array.
# Space complexity: o(1) -> The number of variables created are the same if the array increase its number of elements.
def search(array, length, value_to_find)
  length.times do |index|
    if array[index] == value_to_find
      return true
    end
  end
  return false
#  raise NotImplementedError
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) -> Itarating for each element in the array. If the array increase, the time increase in the same amount.
# Space complexity: O(1) -> The variables are constant -  Space taken is the same for any elements in the array.
def find_largest(array, length)
  temp = array[0]
  length.times do |index|
    if array[index] > temp
      temp = array[index]
    end
  end
  return temp
  # raise NotImplementedError
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n) -> For each elemente in the array - As long in the array so long is the time.
# Space complexity: O(1) -> The variables are constants -  Space taken is the same.
def find_smallest(array, length)
  return nil if length == 0
  temp = array[0]
  length.times do |index|
    if array[index] < temp
      temp = array[index]
    end
  end
  return temp
  # raise NotImplementedError
end

# p find_smallest([2,1,3],3)

# Reverses the values in the integer array in place
# Time complexity: o(n) -> For each n elements in the array.
# Space complexity: o(1) -> All the variables are constants -  Space taken is the same.
def reverse(array, length)
  i = 0
  j = length - 1

    while i < j
    last = array[j]
    first = array[i]

     array[i] = last
     array[j] = first
     i += 1
     j -= 1
    end
 
  return array
  # raise NotImplementedError
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: log2 (n) -> n is the number of elements in the array, sin every time we are divinding the array by 2.
# The time complexity is reduce and increase one at time when we doble the array size. 
# Space complexity: o(1) ->  Space taken is the same for any number of elements in the array.
def binary_search(array, length, value_to_find)
  # Is the beggining of the array
low = 0
# The highest value into the array
hight = length - 1

    # As long as the low value is less or equal the while loop is going to run. 
    while low <= hight
        # Is the middle index into the array, is rounded down. 
        
        middle = (low + hight) / 2
        # If the value in the middle is equal to the guess number return true. 
        if array[middle] == value_to_find
            return true
        end
        # if the value at index middle is less than the guess number
        if array[middle] < value_to_find
            # Update the low value, it means the value is in the second half. 
            # The low value is now half + 1 index
            low = middle + 1
        else
            # Update the higt value, it means middle value is greater than n. 
            # The value is in the first half. 
            hight = middle - 1
        end
    end
    return false
  # raise NotImplementedError
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
