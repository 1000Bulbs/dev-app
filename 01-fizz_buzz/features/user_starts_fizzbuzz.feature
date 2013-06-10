Feature: user starts fizzbuzz

	As a user
	I want to start the fizzbuzz program
	So that I can experience the joys of fizzbuzz
	
	Scenario: start fizzbuzz
		Given I have not yet started fizzbuzz
		When I start the fizzbuzz program
		Then I should see "Welcome to FizzBuzz!"
		And I should see "Begin the sequence ('yes' or 'no')?"