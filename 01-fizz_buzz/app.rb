# Require the bundler gem and then call Bundler.require to load in all gems
# listed in Gemfile.
require 'bundler'
Bundler.require
require './fizzbuzz'

# set :static, true
# set :static_cache_control, [:public, :max_age => 300]

# Route to show all Things, ordered like a blog
get '/things' do
  content_type :json
  @things = find_fizzbuzz 20, 80
  @things.to_json
end

post '/things' do
  content_type :json
  @things = find_fizzbuzz params[:start].to_i, params[:finish].to_i
  @things.to_json
end
