require_relative '../fb'

describe '#fizzbuzz_math' do
  let(:fizzbuzz_to_100) { fizzbuzz_math('100') }
  let(:exclusive_multiples_of_3_to_100) { [3,6,9,12,18,21,24,27,33,36,39,42,48,51,54,57,63,66,69,72,78,81,84,87,93,96,99] }
  let(:exclusive_multiples_of_5_to_100) { [5,10,20,25,35,40,50,55,65,70,80,85,95,100] }
  let(:inclusive_multiples_of_5_and_3_to_100) { [15,30,45,60,75,90] }


  it 'should convert multiples of 3 to Fizz up to 100' do
    exclusive_multiples_of_3_to_100.each do |n|
      expect(fizzbuzz_to_100[n-1]).to eq "Fizz"
    end
  end

  it 'should convert multiples of 5 to Buzz up to 100' do
    exclusive_multiples_of_5_to_100.each do |n|
      expect(fizzbuzz_to_100[n-1]).to eq "Buzz"
    end
  end

  it 'should convert number to FizzBuzz where 3 and 5 are both multiples of N, up to 100' do
    inclusive_multiples_of_5_and_3_to_100.each do |n|
      expect(fizzbuzz_to_100[n-1]).to eq "FizzBuzz"
    end
  end
end
