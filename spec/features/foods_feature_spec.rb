require 'rails_helper'

feature 'foods' do
  scenario 'can not add food unless signed in' do
    visit('/')
    expect(page).not_to have_link('Record a Meal')
  end

  context 'can add foods' do
    scenario 'user can create food entries' do
      sign_up
      visit('/')
      expect(page).to have_link('Record a Meal')
    end

    scenario 'users can fill in foods form', js: true do
      sign_up
      create_food
      expect(current_path).to eq('/migraines')
    end
  end

  scenario 'foods are saved to the database', js: true do
    sign_up
    create_food
    food = Food.first
    expect(food.name).to eq('Cheese, cheddar')
    expect(food.phen_quant).to eq(2.15)
  end

  scenario 'running total of phen level is recorded', js: true do
    sign_up
    create_food
    create_food
    food = User.first.foods.last
    expect(food.phen_run_total).to eq(4.3)
  end
end
