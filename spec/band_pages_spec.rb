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

    it 'allows a user to delete venues from the band' do
      band = Band.create name: 'The Talking Tacos'
      venue = Venue.create name: 'The Taco Truck'
      band.venues.push(venue)
      visit "/bands/#{band.id}"
      click_button("remove_venue_#{venue.id}")
      expect(page).to have_selector ".content-table"
      expect(page).not_to have_selector ".table_cell_venue_#{ venue.id }"
    end

    it 'allows a user to add venues to the band' do
      band = Band.create name: 'The Talking Tacos'
      visit "/bands/#{band.id}"
      fill_in 'new_band_venue_name', with: 'The Taco Truck'
      click_button 'submit-new-venue'
      expect(page).to have_content 'The Taco Truck'
    end
  end

end
