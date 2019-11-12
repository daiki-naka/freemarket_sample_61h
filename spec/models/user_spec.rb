require 'rails_helper'
describe User do
  describe '#create' do

    #メールアドレス
    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid with a email that doesn't match the format" do
      user = build(:user, email: "aaaaaaaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    
    it "is valid with a email that match the format" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a email" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    

  end
end