# require 'algo_box'
# require 'storage/algos/algo_fib'

# AlgosService.new.run_benchmark(8, 500)
class AlgosService
  # extend ActiveSupport::Concern
  include AlgoStore
  include AlgoBench
  # attr_reader :file_name, :file_path

  # AlgosService.new.check_anagrams({word: 'sample', word_bank: ['one', 'two']})
  def check_anagrams(args = {})
    sample_word = 'lemon'
    sample_word_bank = ['nighthawks', 'caret', 'react', 'trace', 'otters', 'melon']

    word = args.fetch(:word, sample_word)
    word_bank = args.fetch(:word_bank, sample_word_bank)

    anagrams_hsh = FindAnagrams.find_anagrams(word, word_bank)
    struct = OpenStruct.new(anagrams_hsh)
  end


  # AlgosService.new.convert_to_roman(675)
  def convert_to_roman(arabic_num)
    converted_hsh = RomanNumerals.convert_to_roman(arabic_num)
    struct = OpenStruct.new(converted_hsh)
  end


  # AlgosService.new.words_in_file
  def words_in_file(args={})
    result_hsh = WordsInFile.find_words_in_string(args)
    struct = OpenStruct.new(result_hsh)
  end



end
