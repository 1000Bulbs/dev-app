<?php
require_once( 'Mustache.php' );

class fizzView
{
	private $template;
	public $view_data;
	
	function __construct($template, $view_data = NULL)
	{
		$this->template = $template;
		$this->view_data = $view_data;
	}
	
	public function display()
	{
		$display = $this->process_template();
		echo $display;
		
	}
	
	private function process_template() {
		$display = '';
		$markup = file_get_contents( $this->template );
		$m = new Mustache;
		$display =  $m->render( $markup, $this->view_data->data );
	    return( $display );
	}
	
}
