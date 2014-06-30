module FeatureMethods

  def sign_in(user)
    visit login_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Login'
  end
end