def sign_up
  visit('/migraines')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up_and_record_migraine
  sign_up
  user = User.find_by(email: 'test@example.com')
  user.migraines.create(date: '30/01/2017', severity: 10, phen_level: 50)
end

def create_more_migraines
  sign_up_and_record_migraine

  user1 = User.find_by(email: 'test@example.com')
  user2 = User.create(email: 'anothertest@test.com', password: 'password')

  user1.migraines.create(date: '01/01/2001', severity: 1, phen_level: 100)
  user1.migraines.create(date: '02/02/2002', severity: 2, phen_level: 200)
  user2.migraines.create(date: '03/03/2003', severity: 3, phen_level: 300)
end

def create_food
  click_link('Log a Meal')
  select('Dairy & Egg', from: 'groups_select')
  fill_in('find_food_field', with: 'cheese')
  click_button('find_food_submit')
  select('Cheese, cheddar', from: 'foods')
  fill_in('food_weight', with: 200)
  click_button('select_food')
end
