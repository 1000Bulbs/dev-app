require 'spec_helper'

module Fizzbuzz
  describe Interactor do
    let(:output) { STDOUT.as_null_object }
    let(:localizer) { Localizer.new({ :three => "Fizz", :five => "Buzz", :three_and_five => "FizzBuzz" }) }
    let(:brain) { Fizzbuzz::Brain.new( localizer ) }
    let(:interactor) { Fizzbuzz::Interactor.new({ :output => output, :localizer => localizer, :brain => brain }) }
    
    describe "#respond_to" do
      context "action is a valid action" do
        context "action is a 'yes' action" do
          it "calls 'run_sequence' method" do
            interactor.should_receive(:run_sequence)
            interactor.respond_to(localizer.actions[:yes])
          end
        end
        context "action is a 'no' action" do
          it "calls 'say_goodbye' method" do
            interactor.should_receive(:say_goodbye)
            interactor.respond_to(localizer.actions[:no])
          end
        end
      end
      context "action is invalid" do
        it "calls 'handle_gibberish' method" do
          interactor.should_receive(:handle_gibberish)
          interactor.respond_to("gibberish")
        end
      end
    end
    
    describe "#welcome_user" do
      it "outputs a welcome message" do
        output.should_receive(:puts).with(localizer.welcome)
        interactor.welcome_user
      end
      it "outputs a begin message" do
        output.should_receive(:puts).with(localizer.begin)
        interactor.welcome_user
      end
    end
    
    describe "#run_sequence" do
      it "outputs a sequence startup message" do
        output.should_receive(:puts).with(localizer.go)
        interactor.run_sequence
      end
      it "initiates the fizzbuzz sequence" do
        interactor.should_receive(:sequence).with(output, brain)
        interactor.run_sequence
      end
      it "outputs a 'go again?' message" do
        output.should_receive(:puts).with(localizer.go_again)
        interactor.run_sequence
      end
    end
    
    describe "#say_goodbye" do
      it "outputs a goodbye message" do
        output.should_receive(:puts).with(localizer.thanks)
        interactor.say_goodbye
      end
    end
    
    describe "#handle_gibberish" do
      it "outputs a message reminding the user of what the valid inputs are" do
        output.should_receive(:puts).with(localizer.gibberish)
        interactor.handle_gibberish
      end
    end
    
    describe "#exit!" do
      it "returns the value of the system terminating output" do
        output.should_receive(:puts).with(localizer.actions[:no])
        output.puts interactor.exit!
      end
    end
  end
end