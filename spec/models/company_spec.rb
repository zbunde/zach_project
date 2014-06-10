require 'spec_helper'


describe Company do
  describe "validations" do

    let(:company) {new_company}
    let(:company2){create_company}
    let(:company3){create_company}

        it 'can create a new companies' do
          expect(company).to be_valid
          expect(company2).to be_valid
          expect(company3).to be_valid
        end

        it 'is not valid without an email' do
          company1 = new_company(email: '')
          expect(company1).to_not be_valid
        end
        it 'can not be a duplicate email' do
          create_company(email: 'whatever@gmail.com')
          company3 = new_company(email: 'whatever@gmail.com')
          expect(company3).to_not be_valid
        end
  end

  end