require 'byebug'

class NokiaTexter
  def initialize(text)
    @text = text
  end
  attr_accessor :text

  def squeeze
    raise(ArgumentError) unless text.is_a? String
    raise(MessageTooLong) if text.length > 160
    return text if text.empty? || !text.include?(' ')
    
    words = text.split(' ')
    words.each_with_index.map do |word, index| 
      index.even? ? word.upcase : word.downcase
    end.join
  end
end


class MessageTooLong < StandardError; end
