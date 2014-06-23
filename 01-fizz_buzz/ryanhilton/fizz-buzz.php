<?php
require_once ('controllers/fizzbuzz-controller.php');
require_once ('models/buzz-model.php');
require_once ('views/fizz-view.php');


$buzz_model = new buzzModel();
$fizz_view = new fizzView('templates/fizz-buzz.mustache', $buzz_model->viewable);
$fb_controller = new fbController($buzz_model, $fizz_view);
