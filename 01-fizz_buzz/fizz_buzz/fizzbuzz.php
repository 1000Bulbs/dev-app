<?php
/*
*	Simple Fizzbuzz Solution
*
*
**/


// Create the numbers array
$numbers = range(1,100);


echo '<ul>';
foreach ($numbers as $k => $v) {
	
	// Multiples of 3 and 5 for Fizzbuzz
	if($v % 3 == 0 && $v % 5 == 0)
	{
		echo "<li>FizzBuzz</li>";
	}
	
	// Multiples of 3 for Fizz
	else if ($v % 3 == 0) 
	{
		echo "<li>Fizz</li>";
	}
	
	// Multiple of 5 for Buzz
	else if ($v % 5 == 0) 
	{
		echo "<li>Buzz</li>";
	}
	
	// If no multiples, echo out the number
	else 
	{
		echo '<li>' .$v. '</li>';
	}
}
echo '</ul>';