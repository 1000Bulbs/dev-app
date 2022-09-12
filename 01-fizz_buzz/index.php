<?php
$numbers = [];
$i;
for ($i = 1; $i <= 100; $i++)
{
    if ($i % 15 == 0)
        $numbers[] = "FizzBuzz" . "  ";
    else if (($i % 3) == 0)
        $numbers[] = "Fizz" . "  "; 
    else if (($i % 5) == 0)                
        $numbers[] = "Buzz" . "  ";  
    else       
        $numbers[] = $i ."  " ;            
}
$json = json_encode($numbers);
echo $json;
?>