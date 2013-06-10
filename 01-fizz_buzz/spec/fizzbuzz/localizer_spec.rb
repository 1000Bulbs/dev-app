require 'spec_helper'

module Fizzbuzz
  describe Localizer do
    let(:localizer) { Localizer.new({ :three => "Fizz", :five => "Buzz", :three_and_five => "FizzBuzz" }) }
    
    describe "#has_action?" do
      context "action is a valid action" do
        it "return true" do
          localizer.has_action?(localizer.actions[:yes]).should be_true
        end
      end
      context "action is an invalid action" do
        it "returns false" do
          localizer.has_action?("jump").should be_false
        end
      end
    end
  end
end