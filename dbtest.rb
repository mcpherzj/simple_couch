#!/usr/bin/env ruby

require 'rubygems'
require 'rest_client'
require 'json'

# local dev couchdb
#DB = "http://127.0.0.1:9393"

# cloudant couchdb on heroku - production
DB = "http://blooming-dawn-565.heroku.com"

if ARGV.first == 'put'
  permalink, rating = ARGV.pop 2
  puts RestClient.post "#{DB}/rate/#{permalink}/#{rating}", ''
end

if ARGV.first == 'get'
  permalink = ARGV.pop
  puts RestClient.get "#{DB}/get_ratings/#{permalink}"
end

if ARGV.first == 'get_all'
  permalink = ARGV.pop
  puts RestClient.get "#{DB}/get_all_ratings"
end
