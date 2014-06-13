require 'spec_helper'


feature 'Company' do
  scenario 'can login with registered credentials' do
    create_company(:email => 'zbunde@gmail.com', :password => 'password')
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'zbunde@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'login'
    expect(page).to have_content 'zbunde@gmail.com'

  end

end