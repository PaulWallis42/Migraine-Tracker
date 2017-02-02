require 'rails_helper'

feature 'migraines' do
  context 'no migraines have been recorded' do
    scenario 'should display a prompt to record a migraine' do
      visit '/migraines'
      expect(page).to have_content 'No Migraines Recorded'
      expect(page).to have_link 'Record a Migraine'
    end
  end

  context 'migraines have been recorded' do
    before do
      Migraine.create(date: '30/01/2017', severity: 10, phen_level: 100)
    end

    scenario 'should display a list of migraines' do
      visit '/migraines'
      expect(page).to have_content('30/01/2017')
      expect(page).to have_content(10)
      expect(page).to have_content(100)
      expect(page).not_to have_content('No Migraines Recorded')
    end
  end
end
