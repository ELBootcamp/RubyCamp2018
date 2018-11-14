class String

  ALPHABET = [*'a'..'z']
  
  def rot13
    downcase!
    each_char do |x| 
      unless x == " "
        unless ALPHABET.include?(x) 
          raise StandardError.new("unknown chars") 
        end
      end
    end
    tr(ALPHABET.join, ALPHABET.rotate(13).join)
  end

end