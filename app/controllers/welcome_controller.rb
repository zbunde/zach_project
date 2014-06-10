class WelcomeController < ApplicationController

  def index
    if current_user
      @listings = Listing.where(:seller_id => session[:seller_id].to_s)
    end
  end
end