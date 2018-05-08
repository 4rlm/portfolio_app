# require 'algo_box'
# require 'storage/algos/algo_fib'

# AlgoService.new.run_benchmark(8, 500)
class AlgoService
  # extend ActiveSupport::Concern
  include AlgoMath
  include AlgoBench
  include AlgoEnum
  # attr_reader :file_name, :file_path

  ####################### I. AlgoMath ####################
  ########## ALGOS BELOW ARE LINKED FROM AlgoMath ##########
  ####### They are smaller and can be run like below. #######
  # They can also be run through AlgoBench fro Benchmarking #
  ###########################################################

  # AlgoService.new.fibonacci_iter(10)
  # AlgoService.new.fibonacci_recurs(n)
  # AlgoService.new.factorial_iter(n)
  # AlgoService.new.factorial_recurs(n)

  # AlgoService.new.linear_search(args)
  # AlgoService.new.global_linear_search(args)
  # AlgoService.new.iterative_binary_search(args)

  ####################### II. AlgoEnum ####################
  ########## ALGOS BELOW ARE LINKED FROM AlgoEnum ##########
  ####### They are smaller and can be run like below. #######
  # They can also be run through AlgoBench fro Benchmarking #
  ###########################################################


  # AlgoService.new.run_enum
  def run_enum
    arr = (0..10).to_a
    find(arr) { |el| el > 1 }
    find(arr) { |el| el < 1 }
    # find(arr) { |el| el > 1 }
  end






  ####################### III. BIG ALGOS ####################
  ##### ALGOS BELOW ARE LARGER FILES, SO START FROM HERE ####
  ###########################################################

  # AlgoService.new.run_sudoku
  def run_sudoku
    binding.pry
    sudoku_scores = Sudoku.run_sudoku
    structs = sudoku_scores.map { |hsh| OpenStruct.new(hsh) }
  end


  # AlgoService.new.run_anagrams({string: 'lemon apple madam'})
  def run_anagrams(args = {})
    anagrams_hsh = Anagram.run_anagrams(args)
    struct = OpenStruct.new(anagrams_hsh)
  end


  # AlgoService.new.run_roman_numerals(675)
  def run_roman_numerals(arabic_num)
    converted_hsh = RomanNumeral.run_roman_numerals(arabic_num)
    struct = OpenStruct.new(converted_hsh)
  end


  # AlgoService.new.run_word_ranker
  def run_word_ranker(args={})
    result_hsh = WordRanker.run_word_ranker(args)
    struct = OpenStruct.new(result_hsh)
  end


  # AlgoService.new.run_pig_latin({string: 'zebras are striped'})
  def run_pig_latin(args={})
    pig_latin_hsh = PigLatin.run_pig_latin(args)
    struct = OpenStruct.new(pig_latin_hsh)
  end


  # AlgoService.new.run_palindrome({string: 'lemon apple madam'})
  def run_palindrome(args={})
    palindrome_hsh = Palindrome.run_palindrome(args)
    struct = OpenStruct.new(palindrome_hsh)
  end


  # AlgoService.new.start_word_search
  def start_word_search(args={})
    score_hsh = WordSearch.start_word_search(args)
    struct = OpenStruct.new(score_hsh)
  end


  # AlgoService.new.start_ssn_tool
  def start_ssn_tool(args={})
    ssn_hashes = SsnTool.start_ssn_tool(args)
    structs = ssn_hashes.map { |hsh| OpenStruct.new(hsh) }
  end


  # AlgoService.new.run_house
  def run_house(args={})
    run_house = House.run_house(args)
    # structs = ssn_hashes.map { |hsh| OpenStruct.new(hsh) }
  end



end
