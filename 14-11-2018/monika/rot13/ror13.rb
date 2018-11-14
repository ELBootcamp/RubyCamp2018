class String

  def ror13

    letters = self.split("")
    polish_letters= ['ą','ę','ó','ś']
    alphabet = ('a'..'z').to_a
    alphabet << ('a'..'z').to_a
    alphabet << ('A'..'Z').to_a
    alphabet << ('A'..'Z').to_a

    new_alphabet = alphabet.flatten

    if (('1'..'9').to_a & letters).empty? && (polish_letters & letters).empty?
      result = letters.map! { |character| new_alphabet.include?(character) ? new_alphabet[new_alphabet.index(character)+13] : character }
      result.join
    elsif !(polish_letters & letters).empty?
        raise ArgumentError.new("polish letters not allowed")
    else 
        raise ArgumentError.new("numbers not allowed")
    end
  end
end








