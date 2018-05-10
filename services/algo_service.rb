# require 'algo_box'
# require 'storage/algos/algo_fib'

# AlgoService.new.run_benchmark(8, 500)
class AlgoService
  # extend ActiveSupport::Concern
  include AlgoMath
  include AlgoBench
  include AlgoEnum


  ## IMPORTANT - CONVERTS EVERY ALGO TO FRONT-END VIEWS ##
  attr_reader :results
  def initialize
    @results = []
  end

  def convert_results(results)
    if results.kind_of?(Array)
      results.map { |hsh| @results << hsh }
    elsif results.kind_of?(Hash)
      @results << results
    end

    return @results
  end


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


  # AlgoService.new.run_fib
  def run_fib(args={})
    num = args.fetch(:num, generate_sm_num)
    fib = fibonacci_iter(num)
    # convert_results(fibonacci_iter(num))
  end


  # AlgoService.new.run_fib
  # def run_fib(args={})
  #   num = args.fetch(:num, generate_sm_num)
  #   binding.pry
  #   fib = fibonacci_iter(num)
  #   binding.pry
  #   # convert_results(fibonacci_iter(num))
  # end

  def generate_sm_num
    num = rand(10..20)
  end

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
    convert_results(Sudoku.run_sudoku)
  end

  # AlgoService.new.run_anagrams({string: 'lemon apple madam'})
  def run_anagrams(args = {})
    convert_results(Anagram.run_anagrams(args))
  end

  # AlgoService.new.run_roman_numerals(675)
  def run_roman_numerals(args = {})
    convert_results(RomanNumeral.run_roman_numerals(args))
  end

  # AlgoService.new.run_word_ranker
  def run_word_ranker(args={})
    convert_results(WordRanker.run_word_ranker(args))
  end


  # AlgoService.new.run_pig_latin({string: 'zebras are striped'})
  def run_pig_latin(args={})
    convert_results(PigLatin.run_pig_latin(args))
    # pig_latin_hsh = PigLatin.run_pig_latin(args)
    # struct = OpenStruct.new(pig_latin_hsh)
  end


  # AlgoService.new.run_palindrome({string: 'lemon apple madam'})
  def run_palindrome(args={})
    convert_results(Palindrome.run_palindrome(args))
    # palindrome_hsh = Palindrome.run_palindrome(args)
    # struct = OpenStruct.new(palindrome_hsh)
  end


  # AlgoService.new.run_word_search
  def run_word_search(args={})
    convert_results(WordSearch.run_word_search(args))
    # score_hsh = WordSearch.run_word_search(args)
    # struct = OpenStruct.new(score_hsh)
  end


  # AlgoService.new.run_ssn_tool
  def run_ssn_tool(args={})
    convert_results(SsnTool.run_ssn_tool(args))
    # ssn_hashes = SsnTool.run_ssn_tool(args)
    # structs = ssn_hashes.map { |hsh| OpenStruct.new(hsh) }
  end


  # AlgoService.new.run_house
  def run_house(args={})
    convert_results(HERE)
    run_house = House.run_house(args)
    # structs = ssn_hashes.map { |hsh| OpenStruct.new(hsh) }
  end



end
