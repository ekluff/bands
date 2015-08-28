require 'spec_helper'

describe 'the band view' do

  describe 'headline', {type: :feature} do
    it 'shows the band name' do
      band = Band.create name: 'The Talking Tacos'
      visit "/bands/#{band.id}"
      expect(page).to have_content band.name
    end
  end

end
