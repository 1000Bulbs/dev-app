class Output
  def messages
    @messages ||= []
  end
  
  def puts(message)
    messages << message
  end
  
  def empty
    @messages = []
  end
  
  def output
    @output ||= Output.new
  end
end

output = Output.new
localizer = Fizzbuzz::Localizer.new({ :three => "Fizz", :five => "Buzz", :three_and_five => "FizzBuzz" })
brain = Fizzbuzz::Brain.new( localizer )
interactor = Fizzbuzz::Interactor.new({ :output => output, :localizer => localizer, :brain => brain })
engine = Fizzbuzz::Engine.new({ :interactor => interactor })

#
# user starts fizzbuzz
#
Given(/^I have not yet started fizzbuzz$/) do
end

When(/^I start the fizzbuzz program$/) do
  output.puts interactor.welcome_user
end

Then(/^I should see "(.*?)"$/) do |message|
  output.messages.should include(message)
end

#
# user initiates sequence
#
Given(/^I have started the Fizzbuzz program$/) do
  output.empty
end

When(/^I respond to a prompt with "(.*?)"$/) do |response|
  engine.perform response
end

Then(/^the Fizzbuzz sequence should begin$/) do
  output.messages.should include("FizzBuzz")
end

Given(/^I have initiated the legendary sequence$/) do
  output.puts 'yes'
end

When(/^the current number in the sequence is "(.*?)"$/) do |number|
end

Then(/^the output should be "(.*?)"$/) do |fizzbuzz_output|
  #puts "fizzbuzz output is: " + fizzbuzz_output
  output.messages.should include(fizzbuzz_output)
end

#
# user plays again
#
Given(/^I have just watched the legendary fizzbuzz sequence$/) do
  output.empty
  engine.perform 'yes'
end

Given(/^I see the prompt "(.*?)"$/) do |message|
  output.messages.should include(message)
end

When(/^I enter "(.*?)"$/) do |input|
  engine.perform input
end

Then(/^I should see the legendary fizzbuzz sequence again$/) do
  output.messages.should include("FizzBuzz")
end

Then(/^the Fizzbuzz system should shut down$/) do
  output.messages.should include("Thanks for playing FizzBuzz!")
end