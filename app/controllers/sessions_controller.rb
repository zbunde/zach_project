class SessionsController < ApplicationController

  def new
    @company = Company.new
  end

  def login
    email = params[:email]
    password = params[:password]
    @company = Company.find_by_email(email)

    if @company && @company.authenticate(password)
      session[:company_id] = @company.id
      flash[:notice] = "Welcome back #{@company.email}"

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