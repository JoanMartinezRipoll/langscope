require 'rails_helper'

RSpec.describe LanguagesController, type: :controller do
  let(:language) { create (:language) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: language
      expect(response).to have_http_status(:success)
    end
  end
end
