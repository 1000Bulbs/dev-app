'use strict';

/**
 * version = Get the version # from package.json
 * program = commander - we're just using it here for some argument flexibility
 * colors  = we don't want just black and white! D:
 */
var version = require('./package.json').version,
  program   = require('commander'),
  colors    = require('colors');

var FizzBuzz = function () {
  program
    .version(version)
    .option('-i, --iterations <n>', 'Number of times to fizz and/or buzz', parseInt)
    .option('-f, --fizz <n>', 'When to fizz', parseInt)
    .option('-b, --buzz <n>', 'When to buzz', parseInt)
    .parse(process.argv);

  // defaults to 100, but will accept -i %n, --iterations %n, or %n as arguments
  this.iterations = program.iterations || parseInt(process.argv[2]) || 100;
  this.fizz = program.fizz || 3;
  this.buzz = program.buzz || 5;
  
  return this;
}

/**
 * We're accepting options only for running tests, minimizing dependencies
 * @param  {[type]} options [description]
 * @return {[type]}         [description]
 */
FizzBuzz.prototype.run = function (options) {
  options = options || {};

  var n = options.iterations || this.iterations,
    fizzAt = options.fizz || this.fizz,
    buzzAt = options.buzz || this.buzz,
    result = '';

  for (var i = 1; i <= n; i++) {
    if ((i % fizzAt === 0) && (i % buzzAt === 0)) {
      result += 'fizzbuzz\n';
      console.log('fizz'.cyan + 'buzz'.rainbow);
    } else if (i % fizzAt === 0) {
      result += 'fizz\n';
      console.log('fizz'.cyan);
    } else if (i % buzzAt === 0) {
      result += 'buzz\n';
      console.log('buzz'.rainbow);
    } else {
      result += String(i) + '\n';
      console.log(String(i).grey);
    }
  }

  return result; // we might be creating a race condition in the test here,
                 // may need to switch to async loop / callback
                 // or we can just test for 10,000,000 iterations and see if it passes consistently
};

module.exports = exports = FizzBuzz;