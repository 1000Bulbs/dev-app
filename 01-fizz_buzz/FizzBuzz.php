<?php

class FizzBuzz{	
	
	public $startCounter;
	public $endCounter;
	public $buzz;
	public $fizz;
	
	public function __construct(){
		
		$this->startCounter = 1;
		$this->endCounter = 100;
		$this->buzz = 5;
		$this->fizz = 3;
	}
	
	public function setCounter($start, $end){
		
		$this->startCounter = $start;
		$this->endCounter = $end;	
	}
}

?>