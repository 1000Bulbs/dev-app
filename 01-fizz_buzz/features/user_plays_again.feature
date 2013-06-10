Feature: user plays again

	As a user
	I want to initiate the fizzbuzz sequence again
	So that I can experience the joys of fizzbuzz again
	
	Scenario: play again
		Given I have just watched the legendary fizzbuzz sequence
		And I see the prompt "Do you want to watch the sequence again ('yes' or 'no')?"
		When I enter "yes"
		Then I should see "Here we go!"
		And I should see the legendary fizzbuzz sequence again
	
	Scenario: quit
		Given I have just watched the legendary fizzbuzz sequence
		And I see the prompt "Do you want to watch the sequence again ('yes' or 'no')?"
		When I enter "no"
		Then I should see "Thanks for playing FizzBuzz!"
		And the Fizzbuzz system should shut down