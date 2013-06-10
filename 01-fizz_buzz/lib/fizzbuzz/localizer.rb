module Fizzbuzz
  class Localizer
    attr_accessor :three, :five, :three_and_five, :welcome, :begin,
                  :go, :go_again, :thanks, :gibberish, :actions
  
    def initialize(options = {})
      @three = options[:three]                   || "Multiple of Three"
      @five = options[:five]                     || "Multiple of Five"
      @three_and_five = options[:three_and_five] || "Multiple of Both Three and Five"
      @welcome = options[:welcome]               || "Welcome to FizzBuzz!"
      @begin = options[:begin]                   || "Begin the sequence ('yes' or 'no')?"
      @go = options[:go]                         || "Here we go!"
      @go_again = options[:go_again]             || "Do you want to watch the sequence again ('yes' or 'no')?"
      @thanks = options[:thanks]                 || "Thanks for playing FizzBuzz!"
      @gibberish = options[:gibberish]           || "Enter 'yes' to run the sequence. Enter 'no' to exit."
      @actions = {}
      @actions[:yes] = options[:yes]             || "yes"
      @actions[:no] = options[:no]               || "no"
    end
    
    def has_action?(action)
      @actions.has_key?(:"#{action}")
    end
  
  end
end