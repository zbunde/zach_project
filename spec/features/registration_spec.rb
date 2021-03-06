require 'spec_helper'


feature 'Guest' do
  scenario 'can register to become a company' do
    visit '/'
    click_on 'Register'
    fill_in 'Email', :with => 'zbunde@gmail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Register'
    expect(page).to have_content 'zbunde@gmail.com'
  end



end