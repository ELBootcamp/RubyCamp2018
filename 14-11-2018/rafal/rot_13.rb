class String

  ALPHABET = [*'a'..'z']
  
  def rot13
    self.downcase!
    self.each_char do |x| 
      raise StandardError.new("unknown chars") unless ALPHABET.include?(x) unless x == " "
    end
    self.tr(ALPHABET.join, ALPHABET.rotate(13).join)
  end

end