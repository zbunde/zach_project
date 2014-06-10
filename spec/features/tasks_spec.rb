require 'spec_helper'


feature 'User' do
  scenario 'can create a task for a listing' do
    seller = (create_seller(:email => 'zbunde@gmail.com', :password => 'password'))
    listing = create_listing(:address => '1234 example street', :seller_id => seller)
    p listing
    visit '/'
    sign_in(seller)
    click_on "#{listing.address}"
    click_on 'Create Task'
    fill_in 'task[name]', :with => 'task one'
    fill_in 'task[description]', :with => 'task one'
    click_on 'Create Task'



  end
end