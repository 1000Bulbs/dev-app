<?php
for($i=1; $i<=100; $i++)
{

  if (is_int($i/3) AND is_int($i/5)) $fizzbuzz = "FizzBuzz";
  else if (is_int($i/3)) $fizzbuzz = "Fizz";
  else if (is_int($i/5)) $fizzbuzz = "Buzz";
  else $fizzbuzz = $i;
  echo $fizzbuzz . "</br>";

}
