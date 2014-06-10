module ObjectCreationMethods

  def create_seller(attributes = {})
    seller = new_seller(attributes)
    seller.save!
    seller
  end

  def new_seller(attributes = {})
    defaults =
      {
        :email => "user#{counter}@gmail.com",
        :password => 'password',
        :password_confirmation => 'password',
      }
    Seller.new(defaults.merge(attributes))
  end

  def create_listing(attributes = {})
    listing = new_listing(attributes)
    listing.save!
    listing
  end

  def new_listing(attributes= {})
    defaults = {
      :address => "123#{counter}example road",
      :owner_name => "Joe Example",
      :seller_id => "1",

    }
    Listing.new(defaults.merge(attributes))
  end

  def counter
    @counter = @counter || -1
    @counter += 1
  end


end