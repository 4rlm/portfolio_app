module SsnTool

  # AlgoService.new.run_ssn_tool
  def self.run_ssn_tool(args={})
    string_block = args.fetch(:original_text, nil)

    if !string_block.present?
      parsed_strings = generate_ssn_num_strings(10)
      string_block = parsed_strings.join(', ')
    else
      parsed_strings = HelperAlgoServ.parse_string_block(string_block)
    end
    # string_block = generate_ssn_num_strings(10) if !string_block.present?
    # parsed_strings = HelperAlgoServ.parse_string_block(string_block)

    result_hashes = parsed_strings.map do |string|
      result_hsh = find_ssn_in_string(string)
      result_hsh.is_a?(::Hash) ? result_hsh : nil
    end

    result_hashes.compact!
    safe_string_block = make_string_block_safe(result_hashes, string_block)
    result_hashes << {original_text: safe_string_block}

    result_hashes
  end


  def self.find_ssn_in_string(string)
    if string.present?
      possible_ssn = string.scan(/\d{3}-\d{2}-\d{4}/).join(', ')
      if possible_ssn.present?
        obfuscated_ssn = obfuscate_ssn(possible_ssn)
        string.gsub!(possible_ssn, obfuscated_ssn)
        result_hsh = { ssn_detection_alert: possible_ssn.present?, possible_ssn: possible_ssn, obfuscated_ssn: obfuscated_ssn, string: string }
      end
    end
  end


  def self.make_string_block_safe(result_hashes, string_block)
    result_hashes.map do |hsh|
      possible_ssn = hsh[:possible_ssn]
      string_block.gsub!(possible_ssn, hsh[:obfuscated_ssn])
    end
    string_block
  end


  # Obfuscate all Social Security Numbers. Example: XXX-XX-4430.
  def self.obfuscate_ssn(ssn)
    obfuscated_ssn = "XXX-XX-#{ssn[-4..-1]}"
  end


  # SsnTool.generate_ssn_num_strings(5)
  def self.generate_ssn_num_strings(string_quantity)
    fk_address = Faker::Address
    fk_job = Faker::Job
    fk_name = Faker::Name
    fk_internet = Faker::Internet
    fk_phone = Faker::PhoneNumber

    fake_ssns = (0..string_quantity).map do
      fk_name.name_with_middle
      full_name = fk_name.name_with_middle
      email_address = fk_internet.email(full_name)
      sample_ssn = "#{rand(329...889)}-#{rand(29...89)}-#{rand(2109...8989)}"
      sample_dob = "#{rand(1...12)}/#{rand(1...28)}/#{rand(1950...2010)}"
      address_meth_names = %w(street_address community city state_abbr zip)
      full_address = address_meth_names.map { |part| fk_address.module_eval(part) }.join(', ')
      job_meth_names = %w(field seniority position key_skill employment_type education_level)
      job_details = job_meth_names.map { |part| fk_job.module_eval(part) }.join(', ')
      string = [full_name, sample_dob, sample_ssn, email_address, fk_phone.cell_phone, full_address, job_details].join(', ')
    end
  end


end
