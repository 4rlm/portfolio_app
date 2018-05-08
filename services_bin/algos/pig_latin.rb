module PigLatin

  # AlgoService.new.run_pig_latin
  def self.run_pig_latin(args={})
    sample_string = 'rabbits love tricks'
    string = args.fetch(:string, sample_string)
    pig_latin = parse_string(string)
    pig_latin_hsh = {string: string, pig_latin: pig_latin}
  end

  def self.parse_string(string)
    array = string.split(/\W+/)
    result = array.map { |str| convert_string(str) }
    string = result.join(' ')
  end

  def self.convert_string(string)
    unless string[0].match(/[aeiouy]/)
      range_end = string.index(/[aeiouy]/)
      leading_consonants = string[0...range_end]
      remainder = string[range_end..-1]
      string = "#{remainder}#{leading_consonants}ay"
    end
    string
  end

end
