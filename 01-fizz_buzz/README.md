# Show us some code #

Specifically: *Write a program that prints the numbers from 1 to 100. But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".*

This is known as the "FizzBuzz" test. It's pretty common. You can find plenty of solutions on [Google](http://lmgtfy.com/?q=fizz+buzz), but that's not the point. Believe it or not you'll have access to Google from work!

The point is to show us you can actually build something. Get as weird with it as you want. Write a RESTful FizzBuzz API. Do it with websockets or write it as a haiku in a Ruby DSL or something?

Automated tests won't hurt. :D

## Got dependencies? ##

Awesome! Bundler. Composer. npm. Whatever it is, just let us know how to grab them.


## Fizzbuzz usage and dependencies ##

Usage: ruby fb.rb MAX_VALUE

The output will output all numbers between 1 and the max_value input, substituting "Fizz" for numbers that are multiples of 3, and "Buzz" where a multiple of 5, "FizzBuzz" where multiples of both 3 and 5. This script was built and tested using Ruby version 3.0.4, so I would encourage using Ruby 3.

## Getting started ##

Run `bundle install` and ensure it executes without conflict.
Run `ruby fb.rb 100` to view the output of the script.
Run `rake spec` to execute rspec tests.
