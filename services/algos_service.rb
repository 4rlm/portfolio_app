# require 'algo_box'
# require 'storage/algos/algo_fib'

# AlgosService.new.run_benchmark(8, 500)
class AlgosService
  # extend ActiveSupport::Concern
  include AlgoMath
  include AlgoBench
  # attr_reader :file_name, :file_path

  ####################### I. SMALL ALGOS ####################
  ########## ALGOS BELOW ARE LINKED FROM AlgoMath ##########
  ####### They are smaller and can be run like below. #######
  # They can also be run through AlgoBench fro Benchmarking #
  ###########################################################

  # AlgosService.new.fibonacci_iter(10)
  # AlgosService.new.fibonacci_recurs(n)
  # AlgosService.new.factorial_iter(n)
  # AlgosService.new.factorial_recurs(n)

  # AlgosService.new.linear_search(args)
  # AlgosService.new.global_linear_search(args)
  # AlgosService.new.iterative_binary_search(args)






  ####################### II. BIG ALGOS ####################
  ##### ALGOS BELOW ARE LARGER FILES, SO START FROM HERE ####
  ###########################################################

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


  # AlgosService.new.start_ssn_tool
  def start_ssn_tool(args={})
    ssn_hashes = SsnTool.start_ssn_tool(args)
    structs = ssn_hashes.map { |hsh| OpenStruct.new(hsh) }
  end



end
