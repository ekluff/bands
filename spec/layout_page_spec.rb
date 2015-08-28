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
  end
end
