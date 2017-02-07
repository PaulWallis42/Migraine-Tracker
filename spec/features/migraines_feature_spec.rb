require 'rails_helper'

feature 'migraines' do
  context 'no migraines have been recorded' do
    scenario 'should display a prompt to record a migraine' do
      visit '/migraines'
      expect(page).to have_content 'Sign in to:'
      expect(page).to have_content 'Record a meal'
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

  context 'migraines have been recorded' do
    before do
      sign_up_and_record_migraine
    end

    scenario 'should display a list of migraines' do
      visit '/migraines'
      expect(page).to have_content('30/01/2017')
      expect(page).to have_content(10)
      expect(page).to have_content(50)
      expect(page).to have_link('Record a Migraine')
      expect(page).not_to have_content('No Migraines Recorded')
      expect(current_path).to eq('/migraines')
    end

    scenario 'fill out a form to record a migraine', js: true do
      visit '/migraines'
      create_food
      click_link 'Record a Migraine'
      fill_in 'Date', with: '01/01/2017'
      select(5, from: 'Severity')
      click_button 'Record Migraine'
      expect(page).to have_content('01/01/2017')
      expect(page).to have_content(5)
      expect(current_path).to eq('/migraines')
    end
  end

  context 'after recroding foods user has migraine' do
    scenario 'user records migraine which saves phen total', js: true do
      sign_up
      create_food
      create_food
      click_link 'Record a Migraine'
      fill_in 'Date', with: '04/01/2017'
      select 3, from: 'Severity'
      click_button 'Record Migraine'
      expect(page).to have_content(4.3)
      user = User.find_by email: 'test@example.com'
      expect(user.foods.last.phen_run_total).to eq(0)
    end
  end

end
