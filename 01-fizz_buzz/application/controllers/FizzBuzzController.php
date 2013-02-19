<?php
class FizzbuzzController extends BaseController {
	
	public function indexAction(){
		
		//Get the fizzbuzz data and render the view
		
		$start = $this->_getParam ( 'start', null );
		$end = $this->_getParam ( 'end', null );
		
		$fizzBuzz = FizzBuzz::getFizzBuzz($start,$end);
		
		$this->view->fizzbuzzdata = $fizzBuzz;
		
	}
	
	public function fizzBuzzAction(){
		
		//Disable the view, return the JSON
		$this->disableView ();
		
		$start = $this->_getParam ( 'start', null );
		$end = $this->_getParam ( 'end', null );
		
		$fizzBuzz = json_encode( FizzBuzz::getFizzBuzz($start,$end));
		
		echo $fizzBuzz;
		
	}
	
}