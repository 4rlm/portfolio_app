module PigLatin

  # AlgoService.new.run_pig_latin
  def self.run_pig_latin(args={})
    string_block = args.fetch(:original_text, nil)
    string_block = generate_strings if !string_block.present?
    parsed_strings = HelperAlgoServ.parse_string_block(string_block)

    pig_latin_strings = parsed_strings.map do |string|
      hsh = { string: string, pig_latin: parse_string(string) }
    end

    pig_latin_strings = check_for_junk(pig_latin_strings)
    pig_latin_strings << { original_text: strings }
  end

  def self.check_for_junk(pig_latin_strings)
    @dups = []
    checked = pig_latin_strings.reject do |hsh|
      arrays = hsh.values.map {|str| str.downcase.scan(/\w+/).uniq }
      dups = arrays.inject { |sum, n| sum & n == n }
      @dups << hsh if dups || hsh[:pig_latin].nil?
    end
  end

  def self.parse_string(string)
    array = string.split(/\W+/)
    result = array.map { |str| convert_string(str) }
    string = result.join(' ')
  end

  def self.convert_string(string)
    unless (string.length < 3) || (string[0].match(/[aeiouy]/))
      begin
        string.downcase!
        range_end = string.index(/[aeiouy]/)
        if range_end > 1
          leading_consonants = string[0...range_end]
          remainder = string[range_end..-1]
          string = "#{remainder}#{leading_consonants}ay"
        end
      rescue
        string
      end
    end
    string
  end

  # SsnTool.generate_ssn_num_strings
  def self.generate_strings
    @faker = Faker
    strings = (0..15).map { [@faker::Simpsons.quote, @faker::WorldOfWarcraft.quote, @faker::StarWars.quote ] }.flatten
    # strings = strings.sort{|a,b| a.length <=> b.length }
    strings = strings.uniq.shuffle.join(', ')
  end

end
