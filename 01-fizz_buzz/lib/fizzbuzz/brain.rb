module Fizzbuzz
  class Brain
    attr_accessor :localizer
  
    def initialize(localizer)
      @localizer = localizer
    end
  
    def determine_fizzbuzz_value_of(num)
      if ( multiple_of_three? num )
        multiple_of_five?(num) ? @localizer.three_and_five : @localizer.three
      else
        multiple_of_five?(num) ? @localizer.five : num.to_s
      end
    end

    def multiple_of_three?(num)
      num % 3 == 0
    end

    def multiple_of_five?(num)
      num % 5 == 0
    end
  end
end