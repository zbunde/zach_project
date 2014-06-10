require 'spec_helper'


feature 'Guest' do
  scenario 'can visit homepage' do
    visit '/'
    expect(page).to have_content 'Hello'

  end
end