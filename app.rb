require 'bundler/setup'
Bundler.require :default

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

before do
  cache_control :public, :no_cache
	cache_control :views, :no_cache
end

get '/' do
  @bands = Band.all
  @venues = Venue.all

  erb :index
end

# band routes

post '/bands/new' do
  name = params.fetch 'new_band_name'
  Band.find_or_create_by name: name.titleize

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

  venue = Venue.find_or_create_by name: new_venue_name.titleize

  band.venues.push(venue) unless band.venues.include?(venue)

  redirect "/bands/#{band_id}"
end

patch '/bands/:id/edit' do
  id = params.fetch 'id'
  new_band_name = params.fetch 'new_band_name'
  band = Band.find(id)

  band.update name: new_band_name

  redirect "/bands/#{band.id}"
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

delete '/venues/:venue_id/bands/:band_id/remove' do
  venue_id = params.fetch 'venue_id'
  band_id = params.fetch 'band_id'
  venue = Venue.find(venue_id)
  band = Band.find(band_id)

  venue.bands.destroy(band)

  redirect "/venues/#{venue_id}"
end

# venue routes

post '/venues/new' do
  name = params.fetch 'new_venue_name'
  Venue.find_or_create_by name: name.titleize

  redirect '/'
end

delete '/venues/:id/delete' do
  id = params.fetch 'id'
  Venue.destroy(id)

  redirect '/'
end

get '/venues/:id' do
  id = params.fetch 'id'
  @venue = Venue.find(id)

  @venues = Venue.all
  @bands = Band.all

  erb :venue
end

post '/venues/:venue_id/add_band' do
  venue_id = params.fetch 'venue_id'
  new_band_name = params.fetch 'new_band_name'
  venue = Venue.find(venue_id)

  band = Band.find_or_create_by name: new_band_name.titleize

  venue.bands.push(band) unless venue.bands.include?(venue)

  redirect "/venues/#{venue_id}"
end

patch '/venues/:id/edit' do
  id = params.fetch 'id'
  new_venue_name = params.fetch 'new_venue_name'
  venue = Venue.find(id)

  venue.update name: new_venue_name

  redirect "/venues/#{venue.id}"
end
