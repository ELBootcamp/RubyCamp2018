require 'spec_helper'
require_relative '../lib/string_utils.rb'

RSpec.describe StringUtils do
  describe "#bangify" do
    context "bangify method for string input" do   
      it "adds exclamation mark to empty string" do
        expect(subject.bangify("")).to eq("!")
      end

      it "adds exclamation mark at the end of string" do
        expect(subject.bangify("what?")).to eq("what?!")
        expect(subject.bangify("what ?")).to eq("what ?!")
      end
    end

    context "bangify method for non-string input" do
      it "handles nil input" do
        expect { subject.bangify(nil) }.to raise_error(ArgumentError)
      end
    end
  end
end
