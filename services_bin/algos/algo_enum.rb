module AlgoEnum

  # arr = (0..10).to_a
  # AlgoService.new.each(arr)
  def each(array)
    i = 0
    while i < array.length
      yield(array[i])
      i += 1
    end
  end



  #find(numbers) { |number| number > 1 }
  # arr = (0..10).to_a
  # AlgoService.new.find(arr) { |el| el > 1 }
  def find(array)
    i = 0
    while i < array.length
      return array[i] if yield(array[i])
      i += 1
    end
  end



end
