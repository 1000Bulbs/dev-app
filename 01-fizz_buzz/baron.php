<?php
for($bd=1;$bd<=100;$bd++)
 	{
    	if($bd%15 == 0)
        	print "FizzBuzz";
    	else if ($bd%5 == 0)
        	print "Buzz";
    	else if($bd%3 == 0)
        	print "Fizz";
    	else
        	print $bd;
    	print "\n";
	}

$name = 'Baron';
echo "<h1>";
echo "You Should Hire $name";
echo "</h1>";
?>


