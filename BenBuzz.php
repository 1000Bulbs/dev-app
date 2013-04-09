<?
for ($i=1; $i<=100; $i++){
  if($i % 5 == 0 and $i % 3 == 0){
		echo 'FizzBuzz <br>';
	} elseif($i % 5 == 0){
		echo 'Buzz <br>';
	} elseif($i % 3 == 0){	
		echo 'Fizz <br>';
	} else {
		echo $i.'<br>';
	}
}
?>

<br> 
------------------------------
<br><br>

<? $Range = range(1,100); ?>

<table>
	<? foreach ($Range as $a => $b) { ?>
		<?
		if($b % 3 == 0 && $b % 5 == 0){
			echo "<tr><td>FizzBuzz</td></tr>";
		} else if ($b % 3 == 0) {
			echo "<tr><td>Fizz</td></tr>";
		} else if ($b % 5 == 0) {
			echo "<tr><td>Buzz</td></tr>";
		} else {
			echo '<tr><td>'.$b.'</td></tr>';
		}
		?>
	<? } ?>
</table>

<br> 
------------------------------
<br><br>

<?
class Buzzer{	
	public function __construct(){
		$this -> MinimumCount = 1;
		$this -> MaximumCount = 100;
		$this -> five = 5;
		$this -> three = 3;
	}
}

$BenBuzz = new Buzzer();
?>

<? for($i = $BenBuzz -> MinimumCount; $i <= $BenBuzz -> MaximumCount; $i++){ ?>
	<? if(
		($i % $BenBuzz -> five == 0) and 
		($i % $BenBuzz -> three == 0)
	){ ?>
		FizzBuzz <br>
	<? } elseif($i % $BenBuzz -> five == 0 ){ ?>
		Buzz <br>
	<? } elseif($i % $BenBuzz -> three == 0 ){ ?>
		Fizz <br>	
	<? } else { ?>
		<? echo $i ?> <br>
	<? } ?>
<? } ?>
