require 'rails_helper'

describe ProductsController, type: :controller do
  describe 'POST #pay' do
    it "renders the :pay template" do
      post :pay
      expect(response).to render_template :pay
    end
  end

end
