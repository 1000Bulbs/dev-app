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
 * @section This class increments a value
 *
 * The count class increments a value
 */

class Count {
    private $config;
    private $sum;

    /**
     * Constructor
     *
     * Instantiate with a provided value or default to 0
     *
     * @param integer start value
     * @return null
     */
    public function __construct($start = 0, $config = null) {
        $this->sum = $start;
        $this->config = $config;
    }

    /**
     * プラス
     *
     * Add a rational number
     *
     * @param integer start value
     * @return null
     */
    public function プラス($value = 1) {
        $this->sum += $value;
        
        $check_three = $this->check_three($this->sum);
        $check_five = $this->check_five($this->sum);

        if (($check_three) && ($check_five)) {
            return $check_three . $check_five;
        } elseif (($check_three) && (!($check_five))) {
            return $check_three;
        } elseif (($check_five) && (!($check_three))) {
            return $check_five;
        }

        return $this->sum;
    }

    /**
     * Check Three
     *
     * Check if the value passed has a modulus by three of zero
     *
     * @param integer start value
     * @return null
     */
    private function check_three($value) {
        if ($value % 3 == 0) {
            return $this->config->translate->getKey('fizz');
        } else {
            return false;
        }
    }

    /**
     * Check Three
     *
     * Check if the value passed has a modulus by five of zero
     *
     * @param integer start value
     * @return null
     */
    private function check_five($value) {
        if ($value % 5 == 0) {
            return $this->config->translate->getKey('buzz');
        } else {
            return false;
        }
    }
}