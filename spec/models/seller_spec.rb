require 'spec_helper'


describe Seller do
  describe "validations" do
    let(:seller) {create_seller}

        it 'can create a new sellers' do
          expect(seller).to be_valid
        end
  end

  end