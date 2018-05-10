# Helpers.parse_string_block(string_block)
module Helpers

  def self.parse_string_block(string_block)
    strings = string_block.split(/[.?!]/)
    strings.map! { |string| string.strip }
  end

end
