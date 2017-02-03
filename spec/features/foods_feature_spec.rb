require 'rails_helper'

feature 'foods' do
  context 'can add foods' do
    scenario 'users can fill in foods form' do
      visit('/foods/new')
      fill_in('name', with: 'chocolate')
      fill_in('food_quantity', with: 100)
      fill_in('phen_quantity', with: 0.5)
      click_button('Submit Food')
      expect(current_path).to eq('/migraines')
    end
  end
end
