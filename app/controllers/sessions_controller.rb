class SessionsController < ApplicationController

  def new
    @seller = Seller.new
  end

  def login
    email = params[:email]
    password = params[:password]
    @seller = Seller.find_by_email(email)

    if @seller && @seller.authenticate(password)
      session[:seller_id] = @seller.id
      flash[:notice] = "Welcome back #{@seller.email}"

      redirect_to root_path
    else
     flash[:notice] = "Email or Password Incorrect"
      render :new
    end


  end

  def logout
    session.clear
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end


end