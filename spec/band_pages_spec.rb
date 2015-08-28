require 'spec_helper'

describe 'the band view' do

  describe 'headline', {type: :feature} do
    it 'shows the band name' do
      band = Band.create name: 'The Talking Tacos'
      visit "/bands/#{band.id}"
      expect(page).to have_content band.name
    end
  end

  describe 'venue list', {type: :feature} do
    it 'shows the venues at which the band has played' do
      band = Band.create name: 'The Talking Tacos'
      venue = Venue.create name: 'The Taco Truck'
      band.venues.push(venue)
      visit "/bands/#{band.id}"
      expect(page).to have_content venue.name
    end
  end

end
