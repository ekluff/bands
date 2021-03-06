require 'spec_helper'

describe 'the layout view' do

  describe 'band menu', {type: :feature} do

    it 'shows all bands' do
      band1 = Band.create name: 'the talking tacos'
      band2 = Band.create name: 'the merriful mariachis'
      visit '/'
      expect(page).to have_content band1.name
      expect(page).to have_content band2.name
    end

    it 'allows the user to add a band from the nav list' do
      visit '/'
      fill_in 'new_band_name', with: 'the talking tacos'
      click_button 'new_band_submit'
      expect(page).to have_content 'The Talking Tacos'
    end

    it 'allows the user to delete bands from the nav menu' do
      band = Band.create name: 'The Talking Tacos'
      visit '/'
      click_button "delete_band_#{band.id}"
      expect(page).to have_no_content 'The Talking Tacos'
    end

  end

  describe 'venue menu', {type: :feature} do

    it 'shows all venues' do
      venue1 = Venue.create name: 'The Taco Truck'
      venue2 = Venue.create name: 'The Burrito Bowl'
      visit '/'
      expect(page).to have_content venue1.name
      expect(page).to have_content venue2.name
    end

    it 'allows the user to add a venue from the nav list' do
      visit '/'
      fill_in 'new_venue_name', with: 'The Taco Truck'
      click_button 'new_venue_submit'
      expect(page).to have_content 'The Taco Truck'
    end

    it 'allows the user to delete venues from the nav menu' do
      venue = Venue.create name: 'The Taco Truck'
      visit '/'
      click_button "delete_venue_#{venue.id}"
      expect(page).to have_no_content 'The Taco Truck'
    end

  end

end
