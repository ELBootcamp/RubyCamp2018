require 'byebug'

class NokiaTexter
  def initialize(text)
    @text = text
  end

  attr_accessor :text

  def squeeze
    text.is_a?(Numeric) && raise(ArgumentError)
    return text if text.empty?
    
    text.split(' ').map.with_index do |word, index|
      transform_text(word, index)
    end.join
    
    text.length > 160 && (raise MessageTooLong)
    text
  end

  private

  def transform_text(word, index)
    index == 0 ? word.upcase : word.capitalize
  end
  
end

class MessageTooLong < StandardError; end