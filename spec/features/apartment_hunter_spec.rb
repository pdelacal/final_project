require 'rails_helper'
require 'faker'

describe "to create an apartment hunter", type: :feature do
  it 'I should be able to visit the homepage and see link for creating an apt hunter' do
    visit('/')
    find_link('Register')
  end

  it 'should be able to create an account' do
    visit('/')
    click_link('Register')
    fill_in 'Name', with: name = Faker::Name
    fill_in 'Email', with: "#{name}@gmail.com"
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Register'
  end

  it 'should be able to log in with facebook' do
    # visit('/')
    # click_link 'Sign in with Facebook'
  end

  it 'should be prompted to fill out questionnaire'
  # do
  #   visit('/')
  #   click_link('Register')
  #   fill_in 'Name', with: name = Faker::Name
  #   fill_in 'Email', with: "#{name}@gmail.com"
  #   fill_in 'Password', with: 'password'
  #   fill_in 'Password confirmation', with: 'password'
  #   click_button 'Register'
  # end

  it 'should be able to fill out questionnaire' do
    visit('/')
    click_link('Register')
    fill_in 'Name', with: name = Faker::Name
    fill_in 'Email', with: "#{name}@gmail.com"
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Register'
    check 'Early 20s'
    check 'Late 20s'
    check '30s'
    uncheck '30s'
    choose 'Male'
    choose 'Either'
    fill_in 'Min', with: '700'
    fill_in 'Max', with: '1100'
    fill_in :move_in_date, with: '08/31/2017'
    choose :duration_long
    check :pet_dog
    fill_in :pet_other, with: "monkey"
    check :like_pet_dog
    check :like_pet_cat
    uncheck :like_pet_cat
    fill_in :like_pet_other, with: "birds, monkey"
    choose :wakeup_early
    choose :wakeup_morning
    choose :bedtime_late
    choose :bedtime_early
    choose :work_standard
    choose :work_from_home_no
    choose :overnight_guests_no
    choose :overnight_guests_yes
    choose :relationship_no
    choose :smoking_no
    choose :messy_no
    choose :environment_both
    choose :party_no
    choose :communicator_no
    choose :friends_over_rarely
    choose :drink_never
    choose :visitors_no
    click_button "Submit"
  end

  it 'should be able to skip questionnaire'
  it 'should be able to login'
  #   do
  #   visit '/'
  #   click_link 'Sign In'
  # end
  
  it 'should be able to logout'

  it 'should be able to list an apartment'
  it 'should be able to search for potential roommates'
  it 'should be able to friend similar roomates'

  it 'should be able to see my friends page'
  # do
  #   visit '/'
  #   click_link "Friends"
  #   page_should have_content "#{user.friends}"
  # end

  it 'should be able to see my profile'


end
