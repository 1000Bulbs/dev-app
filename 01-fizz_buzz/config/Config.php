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
 * @section Specifies configuration options
 *
 * Specifies configuration options
 */

class Config {
    private $option = array();
    public $translate;

    /**
     * Constructor
     *
     * Instantiate class with default values
     *
     * @return null
     */
    public function __construct($option = array()) {
        $this->option = array(
            'language' => 'en',
            'error_reporting' => 'E_ALL',
        );

        foreach ($option as $key => $value) {
            $this->option[$key] = $value;
        }

        $str_language = $this->option['language'];

        require_once('./Count.php');
        require_once('./language/Translate.php');
        include_once('./language/' . $str_language . '.php');

        $this->translate = new $str_language();

        error_reporting($this->option['error_reporting']);
    }

    /**
     * Get
     *
     * Gets the config option for the specified key
     *
     * @param string key
     * @return string value
     */
    public function get($key = '') {
        if (strlen($key) == 0) {
            return false;
        } elseif (array_key_exists($key, $this->option) !== false) {
            return $this->option[$key];
        } else {
            return false;
        }
    }

    /**
     * Set
     *
     * Sets the config option for the specified key
     *
     * @param string key
     * @return null
     */
    public function set($key = '', $value = '') {
        if (strlen($key) == 0) {
            return false;
        } else {
            $this->option = $value;
        }
    }
}