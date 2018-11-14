class String
  ALPHABET = ("a".."z").to_a
  ALPHABET_MOVED = ALPHABET.rotate(13).join
  C_ALPHABET = ("A".."Z").to_a
  C_ALPHABET_MOVED = C_ALPHABET.rotate(13).join

  def rot13
    return "String is empty" if self.empty?
    raise ArgumentError.new("Wrong character in your string") if self.include? "ą"
    raise ArgumentError.new("Wrong character in your string") if self.include? "1"
    raise ArgumentError.new("Wrong character in your string") if self.include? "_"
    
    self.each_char.map { |char| 
    char == char.upcase ? char.tr(C_ALPHABET.join, C_ALPHABET_MOVED) 
                : char.tr(ALPHABET.join, ALPHABET_MOVED)
    }.join
    
  end
end
