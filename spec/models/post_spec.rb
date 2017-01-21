require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) {FactoryGirl.create(:user)}

  describe "creating posts" do

    it "should not be able to create a post with invalid info" do
      expect(FactoryGirl.build(:post, title: "", body: "")).to be_invalid
    end

    it "should be able to post with valid info" do
      expect(FactoryGirl.build(:post, title: "Title", body: "This will work")).to be_valid
    end
  end
end
