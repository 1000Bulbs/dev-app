require 'sinatra'
require './fizzbuzz'

get '/' do
  erb :index
end

get '/fizzbuzz' do
  erb :fizzbuzz
end

not_found do 
  "Whoops! You requested a route that wasn't available."
end
__END__

@@index 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" />
    <title>Fizz Buzz</title>
  </head>
  <body>
    <h1>Fizz Buzz</h1>
    <p><a href="/fizzbuzz">Show me Fizz Buzz</a></p>
  </body> 
</html>


@@fizzbuzz 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" />
    <title>Fizz Buzz</title>
  </head>
  <body>
    <h1>Fizz Buzz Bam</h1>
    <p><a href="/">home</a></p>
    <% 1.upto(100).each do |num| %>
    	<p><%= fizzbuzz(num) %> </p>
    <% end %>
  </body> 
</html>
