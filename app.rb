require 'rubygems'
require 'sinatra'
require 'rest-client'
require 'json'

#DB = 'http://localhost:5984'

get '/get_ratings/:permalink' do
  data = RestClient.get "#{settings.couchdb_url}/eee-meals/_design/ratings/_view/by_permalink?group=true"
  result = JSON.parse( data )['rows'].select do |row|
    row if row['key'] == params[:permalink]
  end

  result.first['value'].to_s unless result.empty?
end

post '/rate/:permalink/:rating' do
  doc_url = "#{settings.couchdb_url}/eee-meals/#{params[:permalink]}"
  rev = JSON.parse( RestClient.get( doc_url ) )['_rev'] rescue nil

  new_doc = {
    'permalink' => params[:permalink],
    'rating' => params[:rating].to_i,
    'type' => 'rating'
  }
  new_doc['_rev'] = rev if rev

  RestClient.put doc_url, new_doc.to_json,
                 :content_type => 'application/json'
end

get '/get_all_ratings' do
  data = RestClient.get "#{settings.couchdb_url}/eee-meals/_design/get_all_ratings/_view/all"
  
  result = JSON.parse( data )

  result.to_s unless result.empty?
end

#get '/contest/'

