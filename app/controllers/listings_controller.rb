class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def index
    @listings = Listing.where(:seller_id => current_user)
  end


  def create
    address = params[:listing][:address]
    owner_name = params[:listing][:owner_name]
    owner_email = params[:listing][:owner_email]
    @listing = Listing.create(:address => address, :owner_name => owner_name, :seller_id => session[:company_id], :owner_email => owner_email)

    if @listing.save
      @company = current_user
      @owner = create_owner(owner_email, address, current_user)
      Mailer.invite_owner(@owner, @company).deliver
      flash[:notice] = t('flash.listing_creation.success')
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @owner = Owner.where(:company_id => params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    address = params[:listing][:address]
    owner_name = params[:listing][:owner_name]
    @listing.update_attributes(:address => address, :owner_name => owner_name)
    if @listing.save
      flash[:notice] = t('flash.listing_creation.updated')
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:notice] = t('flash.listing_creation.deleted')
    redirect_to root_path
  end

  private

  def create_owner (email, address, current_user)
    email = email
    password_reset_token = SecureRandom.urlsafe_base64
    company_id = current_user
    password = generate_password
    Owner.create(:email => email, :password => password, :password_confirmation => password, :address => address, :company_id => company_id, :password_reset_token => password_reset_token)

  end

  def generate_password
    (0...50).map { ('a'..'z').to_a[rand(26)] }.join
  end

end

