module ObjectCreationMethods

  def create_company(attributes = {})
    seller = new_company(attributes)
    seller.save!
    seller
  end

  def new_company(attributes = {})
    defaults =
      {
        :email => "user#{counter}@gmail.com",
        :password => 'password',
        :password_confirmation => 'password',
      }
    Company.new(defaults.merge(attributes))
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