class AuthenticationController < ApplicationController

  def change_password
    token = params[:token]
    @owner = Owner.find_by_password_reset_token(token)
    if @owner.nil?
      flash[:error] = 'You have not requested a password reset.'
      redirect_to :root
    else
      render :change_password
    end
  end

  def update_password
    email = params[:owner][:email]
    new_password = params[:owner][:new_password]
    confirmation = params[:owner][:new_password_confirmation]
    @owner = Owner.find_by_email(email)

    if @owner.update_attributes(password: new_password.presence, password_confirmation: confirmation.presence)
      flash[:notice] = 'Your password has been reset. Please sign in with your new password.'
      redirect_to login_path
    else
      render :password_reset
    end
  end

end



