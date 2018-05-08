module Anagram

  # AlgoService.new.run_anagrams({string: 'lemon apple madam cinema restful fluster'})
  def self.run_anagrams(args = {})
    sample_string = "lemon apple madam cinema restful fluster"
    string = args.fetch(:string, sample_string)
    anagrams = find_anagrams(string)
    anagrams_hsh = { anagrams: anagrams, string: string }
  end

  # array = ['madam', 'restful', 'fluster']
  def self.find_anagrams(word_string)
    original_strs = word_string.downcase.split(/\W+/).sort
    string_hsh = original_strs.zip(original_strs).to_h
    string_hsh.map { |k,v| string_hsh[v] = format_string(v) }
    anagrams = anagrams_in_string_hsh(string_hsh)
  end

  def self.anagrams_in_string_hsh(string_hsh)
    duplicates = find_duplicates(string_hsh.values)
    anagrams = string_hsh.select do |k, v|
      duplicates.include?(v)
    end
    anagrams = anagrams.keys.join(', ')
  end

  def self.find_duplicates(formatted_strs)
    duplicates = formatted_strs.select do |str|
      formatted_strs.count(str) > 1
    end
    duplicates.uniq
  end

  def self.format_string(string)
    formatted_string = string.downcase.chars.sort.join('')
  end


end
