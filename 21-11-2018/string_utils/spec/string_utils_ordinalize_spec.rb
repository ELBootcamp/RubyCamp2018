require 'spec_helper'
require_relative '../lib/string_utils.rb'
  
RSpec.describe StringUtils do
  describe "#ordinalize" do
    context "handling string input with digits" do           
      it "replaces number with an ordinal string" do
        expect(subject.ordinalize("1")).to eq("1st")
        expect(subject.ordinalize("2")).to eq("2nd")          
        expect(subject.ordinalize("1002")).to eq("1002nd")
        expect(subject.ordinalize("1003")).to eq("1003rd")
        expect(subject.ordinalize("-11")).to eq("-11th")
        expect(subject.ordinalize("-1021")).to eq("-1021st")
      end
    end
  
    context "raising errors" do
      it "input without digits" do
        expect { subject.ordinalize("abc") }.to raise_error(ArgumentError)
        expect { subject.ordinalize("") }.to raise_error(ArgumentError)
      end
      it "nil input" do
        expect { subject.ordinalize(nil) }.to raise_error(ArgumentError)
      end
    end
  end
end
  

