def shuffle(array)
  input = array.clone
  output = []
  len = input.length

  while len > 0
    r = Random.rand(0..len-1)
    output << input[r]
    input.delete_at(r)
    len = input.length
  end
  output
end

letters = [:a, :b, :c, :d, :e]
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

# puts shuffle(letters).inspect
# puts shuffle(numbers).inspect
# puts '>>>>>>>>>>>>>>>>>>>>>>>'
# puts letters.inspect
# puts numbers.inspect


# require_relative 'shuffle'

numbers = [0, 5, 3, 7, 8, 6, 2, 1, 4, 9]

first_shuffle_result  = shuffle(numbers)
second_shuffle_result = shuffle(numbers)
third_shuffle_result  = shuffle(numbers)

# This is a heredoc, a way to make multiline strings
shuffle_recap = <<-TEXT
Numbers:  #{numbers}

1st shuffle produced:  #{first_shuffle_result}
2nd shuffle produced:  #{second_shuffle_result}
3rd shuffle produced:  #{third_shuffle_result}
TEXT


puts shuffle_recap


############
# letters = [:a, :b, :c, :d, :e]
# numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
#
# puts shuffle(letters).inspect
# puts shuffle(numbers).inspect
