module FindAnagrams

  def self.find_anagrams(word, word_bank)
    input_word = word_formatter(word)
    anagrams = word_bank.map do |string|
      string if input_word == word_formatter(string)
    end

    anagrams_hsh = { word: word, anagrams: anagrams.compact, word_bank: word_bank }
  end

  def self.word_formatter(word)
    formatted_word = word.downcase.chars.sort.join('')
  end

end
