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
    words.length < 2 && words[1] = ''
    capitalize_words_in_array(words)
  end

  def capitalize_words_in_array(words)

    ending = words.length > 2 ? words[2..-1].map(&:capitalize).join('') : ''
    words[0].upcase + words[1] + ending
  end
end

class MessageTooLong < StandardError;end
