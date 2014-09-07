require './app'
run Sinatra::Application
use Rack::Static, :urls => ['/stylesheets', '/javascripts'], :root => 'public'
