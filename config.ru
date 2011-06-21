require './app'
require 'sinatra'

set :cloudant_url, ENV['CLOUDANT_URL'] || 'http://localhost:5984'

run Sinatra::Application
