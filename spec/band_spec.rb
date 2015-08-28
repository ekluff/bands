require 'spec_helper'

describe(Band) do
  it 'tells you where the band has played' do
    band = Band.create({name: 'The Talking Tacos'})
    venue = Venue.create({name: 'The Taco Truck'})
    band.venues.push(venue)
    expect(band.venues).to eq [venue]
  end

  it 'title cases band names before saving' do
    band = Band.create({name: 'the talking tacos'})
    expect(band.name).to eq 'The Talking Tacos'
  end
end
