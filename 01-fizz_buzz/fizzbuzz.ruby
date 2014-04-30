(1..100).each {|i| 
  if i % 3 == 0 
    print "Fizz"
  end
  if i % 5 == 0
    print "Buzz"
  end
  if (i % 3 > 0) && (i % 5 > 0)
    print i
  end
  print "\n"
}

