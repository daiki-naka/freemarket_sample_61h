require 'rails_helper'

describe SignupController do

  describe 'GET #form1' do
    it "renders the :form1 template" do
      get :form1
      expect(response).to render_template :form1
    end
  end

  describe 'GET #complete' do
    it "renders the :complete template" do
      get :complete
      expect(response).to render_template :complete
    end
  end

end