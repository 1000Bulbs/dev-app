Feature: user initiates sequence
	
	The user initiates the legendary fizzbuzz sequence, and the system begins to iterate 
	through the numbers 1 to 100. The system prints "Fizz" when a multiple of three is
	encountered. The system prints "Buzz" when a multiple of five is encountered. The system
	prints "FizzBuzz" when a multiple of both three and five is encountered. For all other 
	numbers encountered in the sequence, the system prints the number.
	
	Scenario: initiate sequence
		Given I have started the Fizzbuzz program
		When I respond to a prompt with "yes"
		Then the Fizzbuzz sequence should begin
		
	Scenario Outline: the sequence
		Given I have initiated the legendary sequence
		When the current number in the sequence is "<number>"
		Then the output should be "<output>"
		
	Scenarios: multiples of three
		| number | output |
		| 3      | Fizz   |
		| 6      | Fizz   |
		| 12     | Fizz   |
	
	Scenarios: multiples of five
		| number | output |
		| 5      | Buzz   |
		| 10     | Buzz   |
		| 20     | Buzz   |
	
	Scenarios: multiples of three and five
		| number | output 		|
		| 15     | FizzBuzz   |
		| 30     | FizzBuzz   |
		| 45     | FizzBuzz   |
	
	Scenarios: not multiples of three or five
		| number | output |
		| 1      | 1      |
		| 2      | 2      |
		| 4      | 4      |
	
	
	
	
	
	