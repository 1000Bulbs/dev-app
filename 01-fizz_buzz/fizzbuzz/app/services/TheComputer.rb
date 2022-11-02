class TheComputer
  class << self
    def computation
      @calc ||= Calc.new
    end
    
    def will
      yield computation
    end
  end
  class Calc
    attr_accessor :done_before_the
    def will_be_upto(str)
      @will_be_upto ||= str
    end
    def result
      result = []
      NumbersInWords.in_numbers(@will_be_upto).times do |i|

        result.push(i+1) if (i+1) % 3 != 0 
        result.push('fizz') if (i+1) % 3 == 0 && (i+1) % 5 != 0
        result.push('fizzbuzz') if (i+1) % 3 == 0 && (i+1) % 5 == 0
      end
      result.join(' ')
    end
  end
end