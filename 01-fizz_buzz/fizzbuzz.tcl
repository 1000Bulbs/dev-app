for {set i 1} {$i <= 100} {incr i} {
    if {$i % 3 == 0 } {
	puts -nonewline "Fizz"
    }
    if {$i % 5 == 0 } {
	puts -nonewline "Buzz"
    }
    if {($i % 3 > 0) & ($i % 5 > 0) } {
	puts -nonewline $i
    }
    puts ""
}
