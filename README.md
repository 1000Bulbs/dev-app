# Running this version of FizzBuzz #

## Quick Assessment Guide ##

		1. cd into the 01-fizz_buzz directory
		2. 'cucumber'
		3. 'rspec spec --color --format nested'
		4. 'ruby init.rb'
		5. watch the magic of fizzbuzz unfold

## Breakdown ##

The Engine class gets everything started and handles the main loop for the app.

The Interactor class is responsible for serving up the appropriate responses to user actions.

The Brain class is responsible for determining which value, according to the business rules of fizzbuzz, should be offered up for whatever number is passed to it.

The Localizer class is responsible for any (english) user-facing grammar. 

The Sequencer module runs the main fizzbuzz sequence. Seen here:
	
```ruby
(1..100).each do |num|
  output.puts( brain.determine_fizzbuzz_value_of num )
end
```

## Refactoring ##

I would like to apply additional refactoring. However, I have other projects which I must work on as well. But, maybe someday!
