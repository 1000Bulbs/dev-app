# Show us some code #

Specifically: *Write a program that prints the numbers from 1 to 100. But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".*

This is known as the "FizzBuzz" test. It's pretty common. You can find plenty of solutions on [the Googles](http://lmgtfy.com/?q=fizz+buzz), but that's not the point. Believe it or not you'll have access to the Googles from work!

The point is to show us you can actually build something. Get as weird with it as you want. Write a RESTful FizzBuzz API. Do it with websockets or write it as a haiku in a Ruby DSL or something?

Automated tests won't hurt. :D

## Got dependencies? ##

Awesome! Bundler. Composer. npm. Whatever it is, just let us know how to grab them.

# Summary: #
## Bundler dependency for installing gems
## Gems used
* rspec
* guard-rspec

## Instructions
### Get code and setup
* clone repo
* cd 01-fizz_buzz
* bundle install (install gems)

### Run tests
* bundle exec rspec spec

### Run program
* irb
* load 'lib/fizz_buzz.rb'
* FizzBuzz.run

### Automated test of changes
* separate terminal
* cd 01-fizz_buzz
* guard
When changes are made to spec of class file tests are automatically run in this session
