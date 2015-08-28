require 'spec_helper'

describe(Venue) do
  it 'tells you what bands have played there' do
    band = Band.create({name: 'The Talking Tacos'})
    venue = Venue.create({name: 'The Taco Truck'})
    venue.bands.push(band)
    expect(venue.bands).to(eq([band]))
  end
end
