<?php

class fbController {

	private $model;
	private $view;
	
	function __construct (&$model, &$view)
	{
		$this->model = $model;
		$this->view  = $view;				
		$this->load();
	}

	
	
	public function load()
	{
		$this->model->set_viewable();  //load the $view_data into the view_data
		$this->view->display();
	}
}
