require 'spec_helper'


feature 'Seller' do
  scenario 'can login with registered credentials' do
    create_seller(:email => 'zbunde@gmail.com', :password => 'password')
    visit '/'
    click_on 'login'
    fill_in 'Email', :with => 'zbunde@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'login'
    expect(page).to have_content 'Welcome back zbunde@gmail.com'

  end

end