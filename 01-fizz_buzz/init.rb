$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'fizzbuzz'

# setup
localizer = Fizzbuzz::Localizer.new({ :three => "Fizz", :five => "Buzz", :three_and_five => "FizzBuzz" })
brain = Fizzbuzz::Brain.new( localizer )
interactor = Fizzbuzz::Interactor.new({ :output => STDOUT, :localizer => localizer, :brain => brain })
engine = Fizzbuzz::Engine.new({ :interactor => interactor })

# launch
engine.start!