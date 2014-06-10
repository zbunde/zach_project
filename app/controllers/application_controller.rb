class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user


  def current_user
    if logged_in?
      Seller.find(session[:seller_id])
    end

  end

  def logged_in?
    !!session[:seller_id]
  end

end
