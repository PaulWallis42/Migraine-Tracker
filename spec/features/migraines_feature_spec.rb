require 'rails_helper'
require './app/helpers/migraines_helper.rb'

feature 'migraines' do
  context 'no migraines have been recorded' do
    scenario 'should display a prompt to record a migraine' do
      visit '/migraines'
      expect(page).to have_content 'Sign in to record and view migraines'
    end
  end


  context 'migraines have been recorded' do
    include MigrainesHelper
    before do
      Migraine.create(date: '30/01/2017', severity: 10, phen_level: 100)
      sign_up
    end

    scenario 'should display a list of migraines' do
      visit '/migraines'
      expect(page).to have_content('30/01/2017')
      expect(page).to have_content(10)
      expect(page).to have_content(100)
      expect(page).to have_link('Record a Migraine')
      expect(page).not_to have_content('No Migraines Recorded')
      expect(current_path).to eq('/migraines')
    end

    scenario 'fill out a form to record a migraine' do
      visit '/migraines'
      click_link 'Record a Migraine'
      fill_in 'Date', with: '01/01/2017'
      select(5, :from => 'Severity')
      click_button 'Create Migraine'
      expect(page).to have_content('01/01/2017')
      expect(page).to have_content(5)
      expect(current_path).to eq('/migraines')
    end
  end

  context 'user is not signed in' do
    before do
      Migraine.create(date: '01/01/2017', severity: 20)
    end

    scenario 'user does not see a migraine list' do
      visit '/migraines'
      expect(page).not_to have_content(20)
    end
  end
end
