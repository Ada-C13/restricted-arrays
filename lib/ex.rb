#Search algoritm

# def fnde_value(array)
#   index = 0
#   while index < array.length 
#     if array[index] == 4
#       return true
#     end
#       index += 1
#   end
#   return false
# end

# je = fnde_value([2, 4, 5, 6, 7, 8])
# print je

#max algorithm

# def max(array)
#   max = 0
#   index = 0
#   while index < array.length
#     if array[index] > max
#       max = array[index]
#     end
#     index += 1
#   end
#   return max
# end

# je = max([2, 4, 5, 6, 7, 8])
# print je


#binary Search 

array = [1, 2, 3, 4, 5, 6]
value_to_finde = 3

low = 0
high = length -1
while low < high
  (mid = (low+high)/2)
  if mid == value_to_finde 
    return true
    if  mid > value_to_finde 
      high = mid - 1
      if mid < value_to_finde
        low = mid + 1
      end
      return true
    end
  end
  return false
end

        

      








 











