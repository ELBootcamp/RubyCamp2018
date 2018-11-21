require 'spec_helper'
require_relative '../lib/string_utils'

RSpec.describe StringUtils do
  describe '#humanize' do

    context 'when passed only first param' do
      it 'returns human readable output' do
        expect(subject.humanize('employee_salary')).to eq('Employee salary')
        expect(subject.humanize('developer_employee_salary    ')).to eq('Developer employee salary')
        expect(subject.humanize('')).to eq('')
      end

      it 'removes "_id" suffix from human readable output' do
        expect(subject.humanize('author_id')).to eq('Author')
        expect(subject.humanize('author_id_id')).to eq('Author id')
      end

      it 'replaces "_id" suffix with "Id" when only suffix is present' do
        expect(subject.humanize('_id')).to eq('Id')
      end

      it 'returns nil when param is different from string' do
        expect(subject.humanize(2)).to eq(nil)
      end
    end

    context 'when capitalize in option param is set to false' do
      it 'removes "_id" suffix from human readable output' do
        expect(subject.humanize('author_id', capitalize: false)).to eq('author')
      end
    end
  end
end