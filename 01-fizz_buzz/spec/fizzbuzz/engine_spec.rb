require 'spec_helper'

module Fizzbuzz
  describe Engine do
    let(:output) { STDOUT.as_null_object }
    let(:localizer) { Localizer.new({ :three => "Fizz", :five => "Buzz", :three_and_five => "FizzBuzz" }) }
    let(:brain) { Fizzbuzz::Brain.new( localizer ) }
    let(:interactor) { Fizzbuzz::Interactor.new({ :output => STDOUT, :localizer => localizer, :brain => brain }) }
    let(:engine) { Fizzbuzz::Engine.new({ :interactor => interactor }) }
     
    describe "#start!" do  
      it "sends a welcome message" do
        output.should_receive(:puts).with("Welcome to FizzBuzz!")
        engine.stub!(:gets) { localizer.actions[:no] }
        engine.start!
      end
      it "prompts the user the initiate the legendary fizzbuzz sequence" do
        output.should_receive(:puts).with("Begin the sequence ('yes' or 'no')?")
        engine.stub!(:gets) { localizer.actions[:no] }
        engine.start!
      end
    end
    
    describe "#perform_action" do
      let(:yes) { engine.perform localizer.actions[:yes] }
      let(:no) { engine.perform localizer.actions[:no] }
      context "with an input of 'yes'" do
        it "responds with a startup message" do
          output.should_receive(:puts).with(localizer.go)
          yes
        end
        it "runs the legendary fizzbuzz sequence" do
          output.should_receive(:puts).with(localizer.three_and_five)
          yes
        end
        it "asks the user if they want to run the sequence again" do
          output.should_receive(:puts).with(localizer.go_again)
          yes
        end
      end
      context "with an input of 'no'" do
        it "responds with a goodbye message" do
          output.should_receive(:puts).with(localizer.thanks)
          no
        end
        it "shuts down the system" do
          engine.should_receive(:perform).with(localizer.actions[:no])
          engine.stub!(:gets) { localizer.actions[:no] }
          engine.start!
        end
      end
    end
  end
end