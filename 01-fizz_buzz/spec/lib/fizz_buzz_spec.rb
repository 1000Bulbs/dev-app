require 'spec_helper'
require 'fizz_buzz'

describe FizzBuzz do
  it "returns the number" do
    number = 13
    expect(FizzBuzz.results(number)).to eq(number)
  end

  it "prints Fizz for multiple of 3" do
    expect(FizzBuzz.results(3*3)).to eq('Fizz')
  end

  it "prints Fizz for multiple of 5" do
    expect(FizzBuzz.results(5*4)).to eq('Buzz')
  end

  it "prints FizzBuzz for 30" do
    expect(FizzBuzz.results(30)).to eq('FizzBuzz')
  end

  it "retuns 0 remainder for multiple of 3" do
    expect(FizzBuzz.check_fizz(15)).to eq(0)
  end

  it "retuns positive remainder if not multiple of 3" do
    expect(FizzBuzz.check_fizz(16)).to_not eq(0)
  end

  it "retuns 0 remainder for multiple of 5" do
    expect(FizzBuzz.check_buzz(20)).to eq(0)
  end

  it "retuns positive remainder if not multiple of 5" do
    expect(FizzBuzz.check_fizz(16)).to_not eq(0)
  end
end
