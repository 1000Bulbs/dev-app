module Fizzbuzz
  class Interactor
    include Sequencer
    attr_accessor :localizer
    
    def initialize(params={})
      @output = params[:output]
      @localizer = params[:localizer]
      @brain = params[:brain]
    end
    
    def respond_to(action)
      if (@localizer.has_action? action)
        (action == exit!) ? say_goodbye : run_sequence
      else
        handle_gibberish
      end
    end
    
    def welcome_user
      @output.puts @localizer.welcome
      @output.puts @localizer.begin
    end
    
    def run_sequence
      @output.puts @localizer.go
      sequence(@output, @brain)
      @output.puts @localizer.go_again
    end
    
    def say_goodbye
      @output.puts @localizer.thanks
    end
    
    def handle_gibberish
      @output.puts @localizer.gibberish
    end
    
    def exit!
      @localizer.actions[:no]
    end
  end
end