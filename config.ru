require './app'
require 'sinatra'

set :couchdb_url, ENV['COUCHDB_URL'] || 'http://localhost:5984'

run Sinatra::Application
