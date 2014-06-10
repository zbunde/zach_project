require 'spec_helper'


describe Seller do
  describe "validations" do

    let(:seller) {new_seller}
    let(:seller2){create_seller}
    let(:seller3){create_seller}

        it 'can create a new sellers' do
          expect(seller).to be_valid
          expect(seller2).to be_valid
          expect(seller3).to be_valid
        end

        it 'is not valid without an email' do
          seller1 = new_seller(email: '')
          expect(seller1).to_not be_valid
        end
        it 'can not be a duplicate email' do
          create_seller(email: 'whatever@gmail.com')
          seller3 = new_seller(email: 'whatever@gmail.com')
          expect(seller3).to_not be_valid
        end
  end

  end