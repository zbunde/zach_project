require 'spec_helper'

feature 'Listing' do
  scenario 'Registered company can create a listing' do
    create_company(:email => 'zbunde@gmail.com', :password => 'password', :password_confirmation => 'password')
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'zbunde@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Login'
    click_on 'Create Listing'
    fill_in 'Address', :with => '1234test'
    fill_in 'Owner name', :with => 'Joe Example'
    fill_in 'Owner email', :with => 'Joe@Example.com'
    click_on 'Create Listing'
    expect(page).to have_content '1234test'
    expect(page).to have_content 'Joe Example'
  end
end