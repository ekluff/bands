require 'bundler/setup'
Bundler.require :default

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @bands = Band.all
  @venues = Venue.all

  erb :index
end

# band routes

post '/bands/new' do
  name = params.fetch('new_band_name')
  Band.create name: name

  redirect '/'
end

# venue routes

post '/venues/new' do
  name = params.fetch('new_venue_name')
  Venue.create name: name

  redirect '/'
end
