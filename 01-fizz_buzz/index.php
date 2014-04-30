<?php

include('FizzBuzz.php');

$myFizzBuzz = new FizzBuzz();
$myFizzBuzz->setCounter(1, 100);

?>
<html>
	<body>
		<div style="width:500px">
			<div style="text-align:center;font-size:2em;">FizzBuzz!</div>
			<div>
				<?php
				for($i=$myFizzBuzz->startCounter; $i<=$myFizzBuzz->endCounter; $i++){
						
					if( ($i % $myFizzBuzz->buzz == 0) && ($i % $myFizzBuzz->fizz == 0) ){
						?>
						<div style="background-color:rgb(128,128,128);">FizzBuzz</div>
						<?php
					}elseif($i % $myFizzBuzz->buzz == 0 ){
						?>
						<div style="background-color:rgb(192,192,192);">Buzz</div>
						<?php
					}elseif($i % $myFizzBuzz->fizz == 0 ){
						?>
						<div style="background-color:rgb(216,216,216);">Fizz</div>
						<?php
					}else{
						?>
						<div style="background-color:rgb(240,240,240);"><?php print $i ?></div>
						<?php
					}
				}
				?>
			</div>
		</div>
	</body>
</html>