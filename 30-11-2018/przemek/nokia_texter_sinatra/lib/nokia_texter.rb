class NokiaTexter
  attr_accessor :text_msg

  def initialize(input_text)
    @text_msg = input_text
  end

  def squeeze
    (raise ArgumentError) unless text_msg.is_a?(String)
    (raise MethodToLong) unless to_long(text_msg.size)

    text_split = text_msg.split
    text_split.size <= 1 && (return text_msg)

    result = text_split.map.with_index do |word, index|
      index.even? ? word.upcase : word.downcase
    end.join

    (raise MethodToLong) unless to_long(result.size)
    return result
  end

  def to_long(size)
    size < 160
  end
end

class MethodToLong < StandardError; end