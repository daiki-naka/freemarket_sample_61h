require 'rails_helper'
describe User do
  describe '#create' do

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a email that doesn't match the format" do
      user = build(:user, email: "aaaaaaaa")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end
    
    it "is valid with a email that match the format" do
      user = build(:user)
      expect(user).to be_valid
    end

  end
end