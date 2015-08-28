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
