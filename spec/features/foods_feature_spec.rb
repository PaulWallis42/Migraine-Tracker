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
      sign_up
      create_food
      expect(current_path).to eq('/migraines')
    end
  end

  scenario 'foods are saved to the database' do
    sign_up
    create_food
    food = Food.first
    expect(food.name).to eq('chocolate')
    expect(food.food_quant).to eq(100)
    expect(food.phen_quant).to eq(0.5)
  end
end
