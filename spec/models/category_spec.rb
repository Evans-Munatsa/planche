require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:user) {FactoryGirl.create(:user)}

  describe "creating categories" do

    it "should not be able to create a category with invalid info" do
      expect(FactoryGirl.build(:category, name: "")).to be_invalid
    end

    it "should be able to category with valid info" do
      expect(FactoryGirl.build(:category, name: "Title")).to be_valid
    end
  end
end
