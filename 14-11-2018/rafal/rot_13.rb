class String

  ALPHABET = [*'a'..'z']
  
  def rot13
    downcase!
    each_char do |char| 
      unless char == " " || ALPHABET.include?(char) 
          raise StandardError.new("unknown chars") 
      end
    end
    tr(ALPHABET.join, ALPHABET.rotate(13).join)
  end

end