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
 * @section Translate file for English (en) : English
 *
 * Translate file for English (en) : English
 */

class en extends Translate {
    private $keys = array(
        'fizz'  => 'Fizz',
        'buzz'  => 'Buzz',
    );

    /**
     * Get Key
     *
     * Return the value for the key
     *
     * @param string translate key
     * @return string translated string
     */
    public function getKey($key = '') {
        if (strlen($key) == 0) {
            return '';
        } else {
            if (array_key_exists($key, $this->keys)) {
                return $this->keys[$key];
            } else {
                return $key;
            }
        }
    }
}