require 'pry'

def iterative_bsearch(array, value)
  low = 0
  hi = array.length

  while low < hi
    mid = (low + hi) / 2
    if array[mid] == value
      return mid
    elsif array[mid] < value
      low = mid + 1
    else
      hi = mid
    end
  end

  false
end

#########################
arr = 'austin'.chars.sort
value = 'u'
puts iterative_bsearch(arr, value)
