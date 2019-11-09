require 'rails_helper'

describe Product do

  describe '#create-product' do
    it "商品名が空では登録できないこと" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "商品の紹介文が空では登録できないこと" do
      product = build(:product, introduction: "")
      product.valid?
      expect(product.errors[:introduction]).to include("can't be blank")
    end

    it "商品の状態が未選択では登録できないこと" do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end

    it "発送料金負担が未選択では登録できないこと" do
      product = build(:product, d_charge: "")
      product.valid?
      expect(product.errors[:d_charge]).to include("can't be blank")
    end

    it "発送方法が未選択では登録できないこと" do
      product = build(:product, d_method: "")
      product.valid?
      expect(product.errors[:d_method]).to include("can't be blank")
    end

    it "発送元が未選択では登録できないこと" do
      product = build(:product, d_origin: "")
      product.valid?
      expect(product.errors[:d_origin]).to include("can't be blank")
    end

    it "発送までの期間が未選択では登録できないこと" do
      product = build(:product, d_interval: "")
      product.valid?
      expect(product.errors[:d_interval]).to include("can't be blank")
    end

    it "カテゴリーが未選択では登録できないこと" do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it "商品の値段が空では登録できないこと" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

  end

end
