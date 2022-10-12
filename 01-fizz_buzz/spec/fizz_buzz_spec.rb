# frozen_string_literal: true

require 'spec_helper'
require './app/fizz_buzz'

describe 'FizzBuzz' do
  include FizzBuzz

  context 'print number from 1 to provided range' do
    it 'for 1 to 10 it print Fizz for divisible of 3 and Buzz for divisible of 5 and print number for rest values' do
      expect(print_fizz_buzz(10)).to eq([1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz'])
    end

    it 'for 1 to 20 it print Fizz for divisible of 3 and Buzz for divisible of 5 and print FizzBuzz for divisible of both' do
      fizz_buzz_output = [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz', 16, 17, 'Fizz', 19, 'Buzz']
      expect(print_fizz_buzz(20)).to eq(fizz_buzz_output)
    end

    it 'for 0 it return empty arr' do
      expect(print_fizz_buzz(0)).to eq([])
    end

    it 'for negative number it return empty arr' do
      expect(print_fizz_buzz(-10)).to eq([])
    end
  end
end