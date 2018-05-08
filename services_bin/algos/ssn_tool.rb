module SsnTool

  # AlgoService.new.start_ssn_tool
  def self.start_ssn_tool(args={})
    ssn_strings = args.fetch(:ssns, generate_ssn_num_strings)
    @hashes = ssn_strings.map do |ssn_string|
      result_hsh = find_ssn_in_string(ssn_string)
    end
  end


  # SsnTool.generate_ssn_num_strings
  def self.generate_ssn_num_strings
    @faker = Faker
    fake_ssns = (0..5).map do
      string = [@faker::Name.name_with_middle, make_sample_ssn, @faker::Simpsons.quote, @faker::Bank.swift_bic,           @faker::Business.credit_card_number, @faker::Address.latitude ].join(', ')
    end
  end


  def self.make_sample_ssn
    ssn = "#{@faker::Number.number(3)}-#{@faker::Number.number(2)}-#{@faker::Number.number(4)}"
  end


  # Find and return a Social Security Number.
  def self.find_ssn_in_string(ssn_string)
    ssn = ssn_string.scan(/\d{3}-\d{2}-\d{4}/).join(', ')
    safe_ssn = hide_ssn(ssn) if ssn.present?
    result_hsh = { valid: ssn.present?, ssn: ssn, safe_ssn: safe_ssn, ssn_string: ssn_string }
  end


  # Obfuscate all Social Security Numbers. Example: XXX-XX-4430.
  def self.hide_ssn(ssn)
    safe_ssn = "XXX-XX-#{ssn[-4..-1]}"
  end


end
