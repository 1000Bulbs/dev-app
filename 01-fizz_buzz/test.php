<?php
require_once 'fizzbuzz.php';
class FizzBuzzTest extends PHPUnit_Framework_Testcase {
	public function testIterate() {
		$FB = $this->getMock('FizzBuzz', array('makeNoise'));
		
		$FB->expects($this->exactly(50))
			->method('makeNoise');
		$FB->iterate(50);
	}
	
	public function testIterateDefault() {
		$FB = $this->getMock('FizzBuzz', array('makeNoise'));
		
		$FB->expects($this->exactly(100))
			->method('makeNoise');
		$FB->iterate(100);
	}

	public function testMakeNoise_Fizz() {
		$FB = new FizzBuzz();
		ob_start();
		$FB->makeNoise(3);
		$str = ob_get_contents();
		ob_end_clean();
		$this->assertEquals(FizzBuzz::fizz."\n", $str);
	}

	public function testMakeNoise_Buzz() {
		$FB = new FizzBuzz();
		ob_start();
		$FB->makeNoise(5);
		$str = ob_get_contents();
		ob_end_clean();
		$this->assertEquals(FizzBuzz::buzz."\n", $str);
	}

	public function testMakeNoise_FizzBuzz() {
		$FB = new FizzBuzz();
		ob_start();
		$FB->makeNoise(15);
		$str = ob_get_contents();
		ob_end_clean();
		$this->assertEquals(FizzBuzz::fizz.FizzBuzz::buzz."\n", $str);
	}

	public function testMakeNoise_Number() {
		$FB = new FizzBuzz();
		ob_start();
		$FB->makeNoise(1);
		$str = ob_get_contents();
		ob_end_clean();
		$this->assertEquals("1\n", $str);
	}

	public function testFizz_one() {
		$FB = new FizzBuzz();
		$this->assertEquals(NULL, $FB->fizz(1));
	}

	public function testFizz_three() {
		$FB = new FizzBuzz();
		$this->assertEquals(FizzBuzz::fizz, $FB->fizz(3));
	}

	public function testFizz_seven() {
		$FB = new FizzBuzz();
		$this->assertEquals(NULL, $FB->fizz(7));
	}

	public function testFizz_twenty_seven() {
		$FB = new FizzBuzz();
		$this->assertEquals(FizzBuzz::fizz, $FB->fizz(27));
	}

	public function testBuzz_one() {
		$FB = new FizzBuzz();
		$this->assertEquals(NULL, $FB->buzz(1));
	}

	public function testBuzz_five() {
		$FB = new FizzBuzz();
		$this->assertEquals(FizzBuzz::buzz, $FB->buzz(5));
	}

	public function testBuzz_Nineteen() {
		$FB = new FizzBuzz();
		$this->assertEquals(NULL, $FB->buzz(19));
	}

	public function testBuzz_Twenty() {
		$FB = new FizzBuzz();
		$this->assertEquals(FizzBuzz::buzz, $FB->buzz(20));
	}
}
