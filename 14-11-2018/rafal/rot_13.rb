class String

  ALPHABET = [*'a'..'z']
  ROTATED_ALPHABET = ALPHABET.rotate(13)
  
  def rot13
    downcase!
    each_char do |char| 
      unless char == " " || ALPHABET.include?(char) 
          raise StandardError.new("unknown chars") 
      end
    end
    tr(ALPHABET.join, ROTATED_ALPHABET.join)
  end

end