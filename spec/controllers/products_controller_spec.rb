require 'rails_helper'

describe ProductsController, type: :controller do
  describe 'POST #pay' do
    it "renders the :pay template" do
      post :pay
      expect(response).to render_template :pay
    end
  end
end

describe ProductsController, type: :controller do
  context 'current user is seller exhibitting the product' do
    before do
      @user = create(:user)
      @category = create(:category)
      @product = create(:product, user_id: @user.id, category_id: @category.id)
    end
    context 'can destroy' do
      it 'product' do
        expect{delete :destroy, params: {id: @product.id}}.to change(Product, :count).by(-1)
      end
      it 'redirects to root_path' do
        delete :destroy, params: {id: @product.id}
        expect(response).to redirect_to(root_path)
      end
    end
  end
end