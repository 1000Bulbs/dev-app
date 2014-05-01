<?php

/**
 * @file
 * @author  Timothy Sherrell <tsherrell@gmail.com>
 * @version 1.0
 *
 * @section LICENSE
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details at
 * http://www.gnu.org/copyleft/gpl.html
 *
 * @section Counts from 1 to 100 in the specified language
 *
 * Counts from 1 to 100 in the specified language, but replace multiples of three with 'Fizz,'
 *   multiples of five with 'Buzz,' and multiples of three and five with 'FizzBuzz'
 */

require_once('./config/Config.php');

// Config language defaults to 'en' (English), but can be set here
$config = new Config(array('language' => 'ja'));
$count = new Count(0, $config);

header('Content-Type: text/plain; charset=UTF-8;');

for ($i = 1; $i <= 100; $i++) {
    echo $count->プラス(1) . "\n";
}
