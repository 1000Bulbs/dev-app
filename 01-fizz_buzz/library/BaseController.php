<?php

	class BaseController extends Zend_Controller_Action {

		public function init() {

			$defaultLayout = 'layout';
			$this -> _helper -> layout -> setLayout($defaultLayout);

			$this -> view -> controllerName = $this -> getRequest() -> getControllerName();
			$this -> view -> actionName = $this -> getRequest() -> getActionName();

		}

		protected function disableView() {
			$this -> _helper -> layout -> disableLayout();
			$this -> _helper -> viewRenderer -> setNoRender(true);
		}

	}
