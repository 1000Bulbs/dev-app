<?php

class FizzBuzzData
{
	public $data = array();
	private $checkit = array( 15 => 'FizzBuzz', 3 => 'Fizz', 5 => 'Buzz' );
	
	function set_title( $title ){
		$this->data['title'] = $title;	
		$this->both = $this->fizz * $this->buzz;		
		return;
	}
	function set_data(){
		for( $i = 1; $i <= 100; $i++ ){
			$value = $i;
			foreach( $this->checkit as $check => $it ){
				if( $i % $check === 0 ) {
					$value = $it;
					break;
				}
			}
			$this->data['counter'][] = $value;
		}
	}
}

class buzzModel
{

	public $viewable;
	
	function __construct()
	{
		$this->viewable = new FizzBuzzData();
	}
	
	function set_viewable()
	{
		//some data processing here... (business logic)
		$this->viewable->set_title( 'Fizz Buzz - here we go!' );
		$this->viewable->set_data();
	}
	
};