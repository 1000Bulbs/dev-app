<?
/**************************
 * Fizz Buzz
 * Written by Shannon Davis
 * for 1000Bulbs.com
 * March 18, 2013
 * 
 *  To run, use: fizz.php?command=doTheFizzBuzz
 *
 * Count progressively from @param start to @param end, showing "Fizz"
 * on multiples of three and "Buzz" on multiples of five, but on multiples
 * of 3 and 5, show "FizzBuzz".
 *
 * APPLICATION:
 * @param integer $start What number to start on; Default = 1.
 * @param integer $end   What number to stop on; Default = 100.
 * @return something funny
 **************************/

/**
 * FizzBuzz class
 *
 * This is a class for FizzBuzz.
 *
 * Written by Shannon Davis for 1000Bulbs.com
 */
class FizzBuzz
{
        // Define defaults
        public $start = 1;
        public $end   = 100;
        public $negfizz = "Doh! It's not fun when your FizzBuzz wears off!";

        public function __construct()
        {
                // Possible connection to the DB?
                if( !$_REQUEST['json'] )
                {
                        print "<div style='font-family: arial; font-size: 12pt;'>\n";
                }
        }

        public function __destruct()
        {
                if( !$_REQUEST['json'] )
                {
                        print "</div>\n";
                }
                // Call to disconnect from the DB?
        }

        public function setStart($newval)
        {
                $this->start = $newval;
        }

        public function setEnd($newval)
        {
                $this->end = $newval;
        }

        public function doFizzBuzz()
        {
                /* Include user logging features here
                 * Could be anything.
                 */

                if( $this->end > $this->start ) // Check if start and end looks proper
                {
                        $i=$this->start;
                        while($i<=$this->end)
                        {
                                if($i % 3 != 0 && $i % 5 != 0) $result .= $this->style($i,3);
                                if($i % 3 == 0) $result .= $this->style("Fizz",1);
                                if($i % 5 == 0) $result .= $this->style("Buzz",2);
                                $result .= "<br>\n";
                                $i++;
                        }
                        print $result; // Return the results back to the user
                }
                else print $this->negfizz; // Your start and end are wrong
        }

        private function style($text="This is water!",$color=3)
        {
                if ( $color == 1 ) return "<span style='color: red;'>{$text}</span>";
                if ( $color == 2 ) return "<span style='color: blue;'>{$text}</span>";
                if ( $color == 3 ) return "<span style='color: black;'>{$text}</span>";
        }
}

/*********************************************
 * And NOW, Let's see some serious Fizz.
 * 
 * To run, use: fizz.php?command=doTheFizzBuzz
 *********************************************/
$fizzBuzz = new FizzBuzz;

switch( $_REQUEST['command'] )
{
        case "doTheFizzBuzz":
                $params = $_REQUEST;
                if( $params['start'] ) $fizzBuzz->setStart($_REQUEST['start']); // Allow user to specify start
                if( $params['end'] ) $fizzBuzz->setEnd($_REQUEST['end']); // Allow the user to specify end
                $fizzBuzz->doFizzBuzz();
                break;
        default:
                print "Great Scott! Your Fizz has gone Flat or you forgot to specify the CO2!<br>\n";
                break;
}

?>
