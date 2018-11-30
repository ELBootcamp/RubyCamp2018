class NokiaTexter
  def initialize(text)
    @text = text
  end

  attr_accessor :text

  def squeeze
    text.is_a?(Numeric) && raise(ArgumentError)
    return text unless text.include?(' ')
    
    transformed_text.length > 160 ? (raise MessageTooLong) : transformed_text
  end

  def transformed_text   
    @transformed_text ||= text.split(' ').map.with_index do |word, index|
      index % 2 == 0 ? word.upcase : word.downcase
    end.join
  end
end

class MessageTooLong < StandardError; end