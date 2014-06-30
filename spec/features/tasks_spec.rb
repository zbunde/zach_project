require 'spec_helper'


feature 'User' do
  scenario 'can create a task for a listing and delete a task for a listing' do
    company = (create_company(:email => 'zbunde@gmail.com', :password => 'password'))
    listing = create_listing(:address => '1234 example street', :seller_id => company.id, :owner_email => "joe@example.com")
    p listing
    visit '/'
    sign_in(company)
    click_on 'My Listings'
    click_on "#{listing.address}"
    click_on 'Create New Task'
    fill_in 'task[name]', :with => 'task one'
    fill_in 'task[description]', :with => 'task one'
    click_on 'Create Task'
    click_on "task one"
    click_on "Delete"
    expect(page).to have_no_content('task one')
  end
end