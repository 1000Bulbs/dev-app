# 1000bulbs FizzBuzz API

## Create a restful fizzbuzz API.

Fizzbuzz will accpet two integers. It will create a range based on those two integers. It then checks for fizz, buzz, or fizzbuzz worthy integers and returns fizzbuzz in json format.

Sinatra is a good fit for this tiny app. We will also use minitest for testing.

I am using [pow](http://pow.cx) as the development server.

To install:  

    $ curl get.pow.cx | sh  

To set up a Rack app, just symlink it into ~/.pow:  

    $ cd ~/.pow  
    $ ln -s /path/to/myapp  

I renamed my symlink to fizzbuzz. I felt it's easier to remmeber.  

    .pow$ mv 01-fizz_buzz fizzbuzz

I like to use [rvm](http://rvm.io) to manage ny gems.  

    $ rvm use 2.1.2@fizzbuzz --create  
    $ rvm --rvmrc --create 2.1.2@fizzbuzz  

Use bundler it install gems  

    $ bundle install  

Now open your browser to the [fizzbuzz app](http://fizzbuzz.dev).  

If using pow you can [access the site from other devices](http://pow.cx/manual.html#section_2.1.5) as long as they are on the same network.  

Go ahead and send a curl command to see what ya get.

    $ curl --data "start=1&finish=22"  http://fizzbuzz.dev/things  

One could "whip up" an iOS or andriod app to use this. So many possibilities, so little back end.
