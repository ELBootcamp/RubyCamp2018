class NokiaTexter
  attr_accessor :text_msg

  def initialize(input_text)
    @text_msg = input_text
  end

  def squeeze
    (raise ArgumentError) unless text_msg.is_a?(String)
    (raise MethodToLong) unless (text_msg.size < 160)

    text_split = squish_split(text_msg)
    return text_msg if text_split.size <= 1

    text_split.map!.with_index do |word, index|
      index % 2 == 0 ? word.capitalize : word.downcase
    end

    text_split.first.upcase!
    text_split.join
  end

  def squish_split(text_input)
    text_input.split
  end
end

class MethodToLong < StandardError; end