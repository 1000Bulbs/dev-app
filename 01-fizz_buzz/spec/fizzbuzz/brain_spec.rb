require 'spec_helper'

module Fizzbuzz
  describe Brain do
    let(:localizer) { Localizer.new({ :three => "Fizz", :five => "Buzz", :three_and_five => "FizzBuzz" }) }
    let(:brain) { Fizzbuzz::Brain.new( localizer ) }
    
    describe "#determine_fizzbuzz_value_of" do
      context "with a multiple of both three and five" do
        it "returns a string indicating a multiple of both three and five" do
          brain.determine_fizzbuzz_value_of(15).should == localizer.three_and_five
        end
      end
      
      context "with a multiple of three" do
        it "returns a string indicating a multiple of three" do
          brain.determine_fizzbuzz_value_of(9).should == localizer.three
        end
      end
      
      context "with a multiple of five" do
        it "returns a string indicating a multiple of five" do
          brain.determine_fizzbuzz_value_of(25).should == localizer.five
        end
      end
      
      context "with a number which is neither a multiple of three nor a multiple of five" do
        it "returns that number" do
          brain.determine_fizzbuzz_value_of(11).should == 11.to_s
        end
      end
    end
  end
end