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



  def counter
    @counter ||= -1
    @counter += 1
  end

end