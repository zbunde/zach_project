class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    email = params[:company][:email]
    password = params[:company][:password]
    password_confirmation = params[:company][:password_confirmation]

    @company = Company.create(:email => email, :password => password, :password_confirmation => password_confirmation)

    if @company.save
      session[:company_id] = @company.id
      flash[:notice] = "Welcome #{@company.email}"
      redirect_to root_path
    else
      flash[:notice] = "Account not created"
      render :new
    end
  end
end