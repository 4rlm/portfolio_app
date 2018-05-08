# require 'algo_box'
# require 'storage/algos/algo_fib'

# AlgosService.new.run_benchmark(8, 500)
class AlgosService
  # extend ActiveSupport::Concern
  include AlgoStore
  include AlgoBench
  # attr_reader :file_name, :file_path

  # AlgosService.new.run_anagrams({string: 'lemon apple madam'})
  def run_anagrams(args = {})
    anagrams_hsh = Anagram.run_anagrams(args)
    binding.pry
    struct = OpenStruct.new(anagrams_hsh)
  end


  # AlgosService.new.run_roman_numerals(675)
  def run_roman_numerals(arabic_num)
    converted_hsh = RomanNumeral.run_roman_numerals(arabic_num)
    struct = OpenStruct.new(converted_hsh)
  end


  # AlgosService.new.run_word_ranker
  def run_word_ranker(args={})
    result_hsh = WordRanker.run_word_ranker(args)
    struct = OpenStruct.new(result_hsh)
  end


  # AlgosService.new.run_pig_latin({string: 'zebras are striped'})
  def run_pig_latin(args={})
    pig_latin_hsh = PigLatin.run_pig_latin(args)
    struct = OpenStruct.new(pig_latin_hsh)
  end


  # AlgosService.new.run_palindrome({string: 'lemon apple madam'})
  def run_palindrome(args={})
    palindrome_hsh = Palindrome.run_palindrome(args)
    struct = OpenStruct.new(palindrome_hsh)
  end


  # AlgosService.new.start_word_search
  def start_word_search(args={})
    score_hsh = WordSearch.start_word_search(args)
    struct = OpenStruct.new(score_hsh)
  end



end
