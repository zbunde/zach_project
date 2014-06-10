require 'spec_helper'

feature 'Listing' do
  scenario 'Registered seller can create a listing' do
    create_seller(:email => 'zbunde@gmail.com', :password => 'password')
    visit '/'
    click_on 'login'
    fill_in 'Email', :with => 'zbunde@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'login'
    click_on 'Create Listing'
    fill_in 'Address', :with => '1234test'
    fill_in 'Owner name', :with => 'Joe Example'
    click_on 'create'
    expect(page).to have_content '1234test'
    expect(page).to have_content 'Joe Example'


  end
end