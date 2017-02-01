require 'rails_helper'

feature 'migraines' do
  context 'no migraines have been recorded' do
    scenario 'should display a prompt to record a migraine' do
      visit '/migraines'
      expect(page).to have_content 'No Migraines Recorded'
      expect(page).to have_link 'Record a Migraine'
    end
  end
end
