require 'rails_helper'

feature 'foods' do
  context 'can add foods' do
    include MigrainesHelper

    scenario 'user can create food entries' do
      sign_up
      visit('/')
      expect(page).to have_link('Log a Meal')
    end

    scenario 'users can fill in foods form' do
      visit('/foods/new')
      fill_in('Name', with: 'chocolate')
      fill_in('Food Quantity', with: 100)
      fill_in('Phenylalanine Quantity', with: 0.5)
      click_button('Submit Food')
      expect(current_path).to eq('/migraines')
    end
  end
end
