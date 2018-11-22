require 'spec_helper'
require_relative '../lib/string_utils.rb'
  
RSpec.describe StringUtils do
  describe "#titleize" do
    context "handling string input" do           
      it "capitalizes all the words and replaces some characters" do
        expect(subject.titleize('')).to eq('')
        expect(subject.titleize('man from the boondocks')).to eq('Man From The Boondocks')
        expect(subject.titleize("x-men: the last stand")).to eq("X Men: The Last Stand")          
        expect(subject.titleize("TheManWithoutAPast")).to eq("The Man Without A Past")
        expect(subject.titleize("raiders_of_the_lost_ark")).to eq("Raiders Of The Lost Ark")
      end
    end
  
    context "raising errors" do
      it "handling nil input" do
        expect { subject.titleize(nil) }.to raise_error(ArgumentError)
      end
    end
  end
end