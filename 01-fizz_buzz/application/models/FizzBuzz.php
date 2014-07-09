<?php
class FizzBuzz extends BaseModel {
	public function getFizzBuzz($start = 1, $end = 100) {
		$fizzBuzz = array ();
		for($i = $start; $i <= $end; $i ++) {
			if (fmod ( $i, 3 ) == 0 && fmod ( $i, 5 ) == 0) {
				$result = "FizzBuzz";
			} else if (fmod ( $i, 3 ) == 0) {
				$result = "Fizz";
			} else if (fmod ( $i, 5 ) == 0) {
				$result = "Buzz";
			} else {
				$result = $i;
			}
			$fizzBuzz [$i] = $result;
		}
		
		return $fizzBuzz;
	}
}