module Fizzbuzz
  class Engine
    def initialize(params={})
      @interactor = params[:interactor]
    end
    
    def start!
      @interactor.welcome_user
      main_loop
    end
    
    def main_loop
      while action = gets.chomp
        perform action
        break if action == @interactor.exit!
      end
    end
    
    def perform(action)
      @interactor.respond_to action
    end
    
  end
end