'use strict';

var should = require('should'),
    FizzBuzz = require('../app.js'),
    fizzbuzz = new FizzBuzz();

describe('FizzBuzz', function () {
  describe('$ node run', function () {

    var results = fizzbuzz.run({}); // simulate default, 100 iterations, fizz = 3, buzz = 5
    var lines = results.split('\n'); // split into lines

    it('should output 100 lines', function () {
      var count = results.match(/\n/g);
      count.length.should.be.exactly(100); // check for 100 line breaks
    });

    it('should output \'fizz\' at 3 iterations', function () {
      lines[2].should.be.exactly('fizz');
    });

    it('should output \'buzz\' at 5 iterations', function () {
      lines[4].should.be.exactly('buzz');
    });

    it('should output \'fizzbuzz\' at 15 iterations', function () {
      lines[14].should.be.exactly('fizzbuzz');
    });

  });

  describe('$ node run 10 --fizz 10 --buzz 3', function () {

    var results = fizzbuzz.run({ // simulate 10 iterations, fizz at 10
      fizz: 10,
      buzz: 3,
      iterations: 10
    });

    var lines = results.split('\n'); // split into lines

    it('should only run 10 times', function () {
      var count = results.match(/\n/g);
      count.length.should.be.exactly(10); // check for 100 line breaks
    });

    it('should print fizz at line 10', function () {
      lines[9].should.be.exactly('fizz');
    });

  });

  describe('$ node run 10 --buzz 10', function () {

    var results = fizzbuzz.run({ // simulate 10 iterations, fizz at 10
      buzz: 10,
      iterations: 10
    });

    var lines = results.split('\n'); // split into lines

    it('should print buzz at line 10', function () {
      lines[9].should.be.exactly('buzz');
    });
  });

  describe('$ node run 10000', function () { // this is only here to make sure no race condition was created
    var results = fizzbuzz.run({ // 10,000 iterations
      iterations: 10000
    });

    it('should be 10,000 lines', function () {
      var count = results.match(/\n/g);
      count.length.should.be.exactly(10000);
    });
  });
});