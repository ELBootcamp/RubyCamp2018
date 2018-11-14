class String
  alphabet_downcase = ('a'..'z').to_a.zip(('a'..'z').to_a.rotate(13)).to_h
  alphabet_uppercase = ('A'..'Z').to_a.zip(('A'..'Z').to_a.rotate(13)).to_h
  ALPHABET = alphabet_downcase.merge(alphabet_uppercase.merge({' ' => ' '}))

  def rot13
    self.chars.map do |char| 
      raise ArgumentError.new('Argument is not valid alphabet letter') unless ALPHABET.has_key?(char)
      ALPHABET[char]
    end.join
  end
end