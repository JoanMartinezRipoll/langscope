require 'rails_helper'

RSpec.describe CountriesController, type: :controller do
  let(:country) { create (:country) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: country
      expect(response).to have_http_status(:success)
    end
  end

end
