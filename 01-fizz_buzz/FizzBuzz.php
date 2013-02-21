<?php
    /*
     * FizzBuzz Request
     */

     foreach(range(1, 100) as $i) {
         echo ($i %15 ? $i %5 ? $i % 3 ? $i : 'Fizz' : 'Buzz' : 'FizzBuzz') . PHP_EOL;
     }
?>