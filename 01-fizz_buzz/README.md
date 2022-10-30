# Show us some code #

Specifically: *Write a program that prints the numbers from 1 to 100. But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".*

This is known as the "FizzBuzz" test. It's pretty common. You can find plenty of solutions on [Google](http://lmgtfy.com/?q=fizz+buzz), but that's not the point. Believe it or not you'll have access to Google from work!

The point is to show us you can actually build something. Get as weird with it as you want. Write a RESTful FizzBuzz API. Do it with websockets or write it as a haiku in a Ruby DSL or something?

Automated tests won't hurt. :D

## Got dependencies? ##

Awesome! Bundler. Composer. npm. Whatever it is, just let us know how to grab them.


## What I Did ##

#### I got a little crazy... My Stack is and ExpressJs API with React Front End ####

<p>I'm sure you all could read this in my commit messages, but here's the gist of it:</p>

- Wrote a single endpoint `/fizzBuzz` that returns an array of FizzBuzz objects, which can also be filtered
- Added buttons to the UI to allow the user to:
1. Slow down the speed of the network request
2. Trigger an API error
3. Clear the filter
4. Set the filter to 'Fizz'
5. Set the filter to 'Buzz'
6. Set the filter to 'FizzBuzz'

- Display all of the data in a table, with the row numbers correlating to the numbers, 1 through 100
- Next to Fizz, Buzz, or FizzBuzz, display some cute photos
- Make the UI fully responsive
- Write a few acceptance tests
- I was going to set up CI/CD, but figured deploying it to Heroku was probably good enough for y'all

If you want to run the app locally, you'll want to replace the `start` script in the `package.json` with the one under `startDev` (`./node_modules/.bin/concurrently \"./node_modules/.bin/nodemon\" \"npm run client\""`). Just swap those two out and run `npm start`. I have it this was for the Heroku build process.

The concurrently package serves up the Express and React App concurrently, which is super helpful. Nodemon triggers reloads on change (on the express side) without having to shut down and serve each time.

Wow - just realized I named my Heroku App 1000k-bulbs. I'm a genius 💡 You were 1000 bulbs, now you're 100,000 bulbs. Amazing.

[Here's the link to the final product](https://fizz-buzz-1000k-bulbs.herokuapp.com/)