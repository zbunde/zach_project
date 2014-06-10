class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def create
    address = params[:listing][:address]
    owner_name = params[:listing][:owner_name]
    @listing = Listing.create(:address => address, :owner_name => owner_name, :seller_id => session[:seller_id])

    if @listing.save
      flash[:notice] = "Listing created"
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
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
      flash[:notice] = "Listing Updated"
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:notice] = "Listing Deleted"
    redirect_to root_path
  end

end

