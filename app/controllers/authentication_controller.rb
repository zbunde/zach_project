class AuthenticationController < ApplicationController
  def change_password
    token = params[0]
    @owner = Owner.find_by_password_reset_token(token)
    if @user.nil?
      flash[:error] = 'You have not requested a password reset.'
      redirect_to :root
  end

  def update_password

  end
  end
end

