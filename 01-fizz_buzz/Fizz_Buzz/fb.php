<?php

function fizzBuzz() {
    $result = '';

    for ($i = 1; $i <= 100; $i++)
    {
        if ((($i % 3) == 0) && (($i % 5) == 0)) {
            $result = $result . 'FizzBuzz<br />';
        } else if (($i % 3) == 0) {
            $result = $result . 'Fizz ';
        } else if (($i % 5) == 0) {
            $result = $result . 'Buzz<br />';
        } else {
            $result = $result . "{$i} ";
        }
    }

    return $result;
}

fizzBuzz();
?>