# HelperAlgoServ.parse_string_block(string_block)
module HelperAlgoServ

  def self.parse_string_block(string_block)
    # strings = string_block.split(/[.?!]/) ## Below is improved.  Delete this after testing.
    strings = string_block.split(/\.\s+|!|\?/)
  end


end
