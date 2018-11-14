class String

  Polish_letters= ['ą','ę','ó','ś']
  Alphabet = ('a'..'z').to_a
  Alphabet << ('a'..'z').to_a
  Alphabet << ('A'..'Z').to_a
  Alphabet << ('A'..'Z').to_a  

  def ror13
    letters = self.split("")
    new_alphabet = alphabet.flatten

    if (('0'..'9').to_a & letters).empty? && (polish_letters & letters).empty?
      result = Letters.map! { |character| new_alphabet.include?(character) ? new_alphabet[new_alphabet.index(character)+13] : character }
      result.join
    elsif !(Polish_letters & letters).empty?
        raise ArgumentError.new("polish letters not allowed")
    else 
        raise ArgumentError.new("numbers not allowed")
    end
  end
end










