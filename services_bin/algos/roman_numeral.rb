module RomanNumeral

  def self.run_roman_numerals(args = {})
    arabic_nums = args.fetch(:arabic_nums, nil)

    if !arabic_nums.present?
      arabic_nums = sample_arabic_nums
    else
      if arabic_nums.is_a?(::String)
        arabic_nums = arabic_nums.scan(/\d+/)
        arabic_nums.map! { |num| num.to_i }
      end
    end

    roman_nums = arabic_nums.map { |num| convert_to_modern(num) }
  end


  def self.convert_to_classic(arabic_num)
    answer = arabic_num / 1000 # 1
    remainder = arabic_num % 1000 # 1
    thousands = "M" * answer

    answer = remainder / 500 # 1
    remainder = arabic_num % 500 # 1
    five_hundreds = "D" * answer

    answer = remainder / 100 # 1
    remainder = arabic_num % 100 # 1
    hundreds = "C" * answer

    answer = remainder / 50 # 1
    remainder = arabic_num % 50 # 1
    fifties = "L" * answer

    answer = remainder / 10 # 1 top of logic
    remainder = arabic_num % 10 # 6
    tens = "X" * answer

    answer = remainder / 5 # 1
    remainder = arabic_num % 5 # 1
    fives = "V" * answer

    answer_n = remainder / 1 #
    ones = "I" * answer_n

    roman_num = thousands + five_hundreds + hundreds + fifties + tens + fives + ones
  end


  def self.convert_to_modern(arabic_num)
    classic_roman_num = convert_to_classic(arabic_num)
    modern_conversions = {'DCCCC'=> 'CM', 'CCCC'=> 'CD', 'LXXXX'=> 'XC', 'XXXX'=> 'XL', 'VIIII'=> 'IX', 'IIII'=> 'IV'}

    modern_roman_num = classic_roman_num
    modern_conversions.each do |k,v|
      if classic_roman_num.include?(k)
        modern_conversions = classic_roman_num.gsub(k,v)
      end
    end

    same = false if modern_roman_num == classic_roman_num
    converted_hsh = { arabic_num: arabic_num,
                      classic_roman_num: classic_roman_num,
                      modern_roman_num: modern_roman_num,
                      same: same || true
                    }
  end

  def self.sample_arabic_nums
    numbers = (0..20).map { rand(999..9999) }
  end


end
