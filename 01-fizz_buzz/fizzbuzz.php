<?php
class FizzBuzz {
	const fizz = 'Fizz';
	const buzz = 'Buzz';
	
	public function iterate($max = 100) {
		for($i = 1; $i <= $max; $i++) {
			$this->makeNoise($i);
		}
	}

	public function makeNoise($i) {
		$fizz = $this->fizz($i);
		$buzz = $this->buzz($i);
		if(is_null($fizz) != true) {
			echo $fizz;
		}
		if(is_null($buzz) != true) {
			echo $buzz;
		}
		if(is_null($fizz) && is_null($buzz)) {
			echo $i;
		}
		echo "\n";
	}

	public function fizz($i) {
		return $this->noise($i, 3, self::fizz);
	}
	
	public function buzz($i) {
		return $this->noise($i, 5, self::buzz);
	}

	protected function noise($i, $multiple, $noise) {
		$return = null;
		if(($i % $multiple) == 0) {
			$return = $noise;
		}
		return $return;
	}
}
