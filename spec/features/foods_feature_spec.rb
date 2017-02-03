require 'rails_helper'

feature 'foods' do
  include MigrainesHelper

  scenario 'can not add food unless signed in' do
    visit('/')
    expect(page).to have_content('Sign in to record meals')
    expect(page).not_to have_link('Log a Meal')
  end

  context 'can add foods' do
    scenario 'user can create food entries' do
      sign_up
      visit('/')
      expect(page).to have_link('Log a Meal')
    end

    scenario 'users can fill in foods form' do
      visit('/foods/new')
      fill_in('Food', with: 'chocolate')
      fill_in('Quantity', with: 100)
      fill_in('Phenylalanine Quantity', with: 0.5)
      click_button('Submit Food')
      expect(current_path).to eq('/migraines')
    end
  end
end
