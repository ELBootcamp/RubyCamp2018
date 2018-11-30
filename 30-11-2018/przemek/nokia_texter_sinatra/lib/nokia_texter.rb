class NokiaTexter
  attr_accessor :text_msg

  def initialize(input_text)
    @text_msg = input_text
  end

  def squeeze
    (raise ArgumentError) unless text_msg.is_a?(String)
    (raise MethodToLong) unless (text_msg.size < 160)

    text_split = text_msg.split
    text_split.size <= 1 && (return text_msg)

    text_split.map.with_index do |word, index|
      index.even? ? word.upcase : word.downcase
    end.join
  end
end

class MethodToLong < StandardError; end