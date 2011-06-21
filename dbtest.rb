#!/usr/bin/env ruby

require 'rubygems'
require 'rest_client'
require 'json'

# local dev couchdb
#DB = "http://127.0.0.1:9393"

# cloudant couchdb on heroku - production
webapp = "http://blooming-dawn-565.herokuapp.com"
DB = "https://app572511.heroku:x76x0mVA6FDIcRmBxxnuJodX@app572511.heroku.cloudant.com"

if ARGV.first == 'put'
  permalink, rating = ARGV.pop 2
  puts RestClient.post "#{webapp}/rate/#{permalink}/#{rating}", ''
end

if ARGV.first == 'get'
  permalink = ARGV.pop
  puts RestClient.get "#{webapp}/get_ratings/#{permalink}"
end

if ARGV.first == 'get_all'
  permalink = ARGV.pop
  puts RestClient.get "#{webapp}/get_all_ratings"
end

if ARGV.first == 'get_doc'
  permalink = ARGV.pop
  puts RestClient.get "#{DB}/eee-meals/#{permalink}"
end
