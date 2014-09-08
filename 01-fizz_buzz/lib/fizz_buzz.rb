class FizzBuzz
  def self.run
    (1..100).each do |num|
      val = results(num)
      puts val unless num == 0
    end
  end

  def self.results(value)
    results = ''
    results << 'Fizz' if check_fizz(value) == 0
    results << 'Buzz' if check_buzz(value) == 0
    results = value if results.empty?
    results
  end

  def self.check_fizz(num)
    check = num % 3
    check
  end

  def self.check_buzz(num)
    num % 5
  end
end
