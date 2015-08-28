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
  name = params.fetch 'new_band_name'
  Band.create name: name

  redirect '/'
end

delete '/bands/:id/delete' do
  id = params.fetch 'id'
  Band.destroy(id)

  redirect '/'
end

get '/bands/:id' do
  id = params.fetch 'id'
  @band = Band.find(id)

  @bands = Band.all
  @venues = Venue.all

  erb :band
end

post '/bands/:band_id/add_venue' do
  band_id = params.fetch 'band_id'
  new_venue_name = params.fetch 'new_venue_name'
  band = Band.find(band_id)

  Venue.find_or_create_by name: new_venue_name

  redirect "/bands/#{band_id}"
end

# bands_venues routes

delete '/bands/:band_id/venues/:venue_id/remove' do
  band_id = params.fetch 'band_id'
  venue_id = params.fetch 'venue_id'
  band = Band.find(band_id)
  venue = Venue.find(venue_id)

  band.venues.destroy(venue)

  redirect "/bands/#{band_id}"
end

# venue routes

post '/venues/new' do
  name = params.fetch 'new_venue_name'
  Venue.create name: name

  redirect '/'
end

delete '/venues/:id/delete' do
  id = params.fetch 'id'
  Venue.destroy(id)

  redirect '/'
end
