# Notes from Lars #

## What's in here ##

This is a Rails 3.2.12 app with several dependencies in the Gemfile, including:

- Devise
- CanCan
- Foundation

The database uses the default SQLite for simplicity's sake.

A few random gems for development:

- better_errors
- binding_of_caller (supports better_errors)

## Getting started ##

Nothing special to get started.

    rake db:create
    rake db:migrate

There is a default user in the db:seed file.

    rake db:seed


# Show us some code #

Specifically: *Write a program that prints the numbers from 1 to 100. But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".*

This is known as the "FizzBuzz" test. It's pretty common. You can find plenty of solutions on [the Googles](http://lmgtfy.com/?q=fizz+buzz), but that's not the point. Believe it or not you'll have access to the Googles from work!

The point is to show us you can actually build something. Get as weird with it as you want. Write a RESTful FizzBuzz API. Do it with websockets or write it as a haiku in a Ruby DSL or something?

Automated tests won't hurt. :D

## Got dependencies? ##

Awesome! Bundler. Composer. npm. Whatever it is, just let us know how to grab them.
