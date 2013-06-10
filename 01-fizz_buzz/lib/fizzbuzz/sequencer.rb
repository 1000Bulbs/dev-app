module Fizzbuzz
  module Sequencer
    
    def sequence(output, brain)
      (1..100).each do |num|
        output.puts( brain.determine_fizzbuzz_value_of num )
      end
    end
    
  end
end