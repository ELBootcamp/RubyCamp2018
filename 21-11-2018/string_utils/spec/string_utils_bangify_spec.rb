require 'spec_helper'
require_relative '../lib/string_utils.rb'

RSpec.describe "StringUtils" do
  context "bangify method for string input" do   
    it "adds exclamation mark to empty string" do
      expect(StringUtils.bangify("")).to eq("!")
    end

    it "adds exclamation mark at the end of string" do
      expect(StringUtils.bangify("what?")).to eq("what?!")
    end
  end

  context "bangify method for non-string input" do
    it "handles nil input" do
      expect { StringUtils.bangify(nil) }.to raise_error(ArgumentError)
    end
  end
end
