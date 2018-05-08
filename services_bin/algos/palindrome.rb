module Palindrome

  # AlgosService.new.run_palindrome({string: 'lemon apple madam cinema restful fluster'})
  def self.run_palindrome(args = {})
    sample_string = "lemon apple madam cinema restful fluster"
    string = args.fetch(:string, sample_string)
    palindromes = find_palindromes(string)
    palindromes_hsh = { palindromes: palindromes, string: string }
  end

  # # array = ['madam', 'restful', 'fluster']
  def self.find_palindromes(word_string)
    original_strs = word_string.downcase.split(/\W+/).sort

    palindromes = original_strs.select do |str|
      str == str.reverse
    end

    palindromes = palindromes.sort.join(', ')
  end

end
