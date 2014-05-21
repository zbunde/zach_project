class SellersController < ApplicationController
  def new
    @seller = Seller.new
  end

  def create
    email = params[:seller][:email]
    password = params[:seller][:password]
    password_confirmation = params[:seller][:password_confirmation]

    seller = Seller.create(:email => email, :password => password, :password_confirmation => password_confirmation)

    if seller.save
      session[:current_seller] = seller.id
      flash[:notice] = "Welcome #{seller.email}"
      redirect_to root_path
    else
      flash[:notice] = "Account not created"

      render :new
    end
  end
end