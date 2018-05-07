module WordsInFile

  # AlgosService.new.words_in_file
  def self.find_words_in_string(args={})
    word_string = args.fetch(:word_string, sample_word_string)
    string_count_hash = count_strings(word_string)
    word_rankings = sort_counted_strings(string_count_hash)

    result_hsh = {word_string: word_string, word_rankings: word_rankings }
  end

  def self.sort_counted_strings(string_count_hash)
    word_rankings = string_count_hash.sort_by {|_key, value| value}
    word_rankings.reverse!
  end

  def self.count_strings(word_string)
    array = word_string.split()
    string_count_hash = array.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h
  end


  def self.sample_word_string
    sample_word_string = "In the 1830s, pioneers began to settle the area in central Austin along the Colorado River. In 1839, the site was chosen to replace Houston as the capital of the Republic of Texas and was incorporated under the name Waterloo. Shortly afterward, the name was changed to Austin in honor of Stephen F. Austin, the Father of Texas and the republic's first secretary of state. The city grew throughout the 19th century and became a center for government and education with the construction of the Texas State Capitol and the University of Texas at Austin.[10] After a lull in growth from the Great Depression, Austin resumed its development into a major city, and by the 1980s it emerged as a center for technology and business.[11] A number of Fortune 500 companies have headquarters or regional offices in Austin, including Amazon.com, Apple Inc., Cisco, eBay, General Motors, Google, IBM, Intel, Oracle Corporation, Paypal, Texas Instruments, 3M, and Whole Foods Market.[12] Dell's worldwide headquarters is located in nearby Round Rock, a suburb of Austin."
  end


end
