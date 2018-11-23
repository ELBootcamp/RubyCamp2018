require 'spec_helper'
require_relative '../lib/string_utils'

RSpec.describe StringUtils do
  describe '#text_wrap' do
    it 'adds new line special char after specified length' do
      expect(subject.text_wrap('Once upon...', 4)).to eq("Once\n upo\nn...")
      expect(subject.text_wrap('Once upon time...', 4)).to eq("Once\n upo\nn ti\nme..\n.")
    end

    it 'returns empty string when text is empty' do
      expect(subject.text_wrap('', 4)).to eq('')
    end

    it 'returns original text when line_width is equal to 0' do
      expect(subject.text_wrap('Once upon...', 0)).to eq('Once upon...')
    end

    it 'returns original text when line_width is less than 0' do
      expect(subject.text_wrap('Once Once upon...', -3)).to eq("On\nce \nOnc\ne u\npon\n...")
    end
  end
end