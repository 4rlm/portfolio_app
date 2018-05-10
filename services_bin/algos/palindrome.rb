module Palindrome

  # AlgoService.new.run_palindrome({string: 'lemon apple madam cinema restful fluster'})
  def self.run_palindrome(args = {})
    string_block = args.fetch(:original_text, nil)
    string_block = sample_string_block if !string_block.present?
    strings = Helpers.parse_string_block(string_block)

    palindromes = strings.map do |string|
      { input_string: string, palindromes: find_palindromes(string) }
    end

    palindromes << {original_text: string_block}
  end

  # # array = ['madam', 'restful', 'fluster']
  def self.find_palindromes(word_string)
    original_strs = word_string.downcase.split(/\W+/).sort

    palindromes = original_strs.select do |str|
      str == str.reverse if str.length > 1
    end

    palindromes = palindromes.sort.join(', ')
  end

  def self.sample_string_block
    "My best friend's name is Anna. Don't you love the civic opera? How much is a kayak? My Spanish level is low, but I have fun. Excuse me, Madam?  Is this yours? Where's your mom today? Let's go for lunch at noon. Did you see that racecar? When was the radar invented? Your face is redder than a tomato. So we somehow refer cases to you? How much is it to repaper the living room? The rotator was connected to the log by a rope 6 ft. I heard the tail rotor buzz again. For later versions and adaptations of the sagas see O. His guitar solos are just unbelievable. As a doctor, Kent strongly believes the tenet of never doing any harm. Wow, you made this by yourself?"
  end

end
