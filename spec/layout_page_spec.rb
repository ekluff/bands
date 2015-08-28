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

    it 'allows the user to add a new venue from the nav list' do
      visit '/'
      fill_in 'new_venue_name', with: 'the taco truck'
      click_button 'new_venue_submit'
      expect(page).to have_content 'The Taco Truck'
    end
  end
end
