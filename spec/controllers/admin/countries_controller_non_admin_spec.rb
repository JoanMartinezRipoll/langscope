require 'rails_helper'

#This file tests that non logged in users and non admin schools can not perform admin compromised actions
RSpec.describe Admin::CountriesController, type: :controller do
  let(:country) { create(:country) }

  describe "non logged in school" do
    it "#index redirects to sign_in" do
      get :index
      expect(response).to redirect_to new_school_session_url
    end

    it "#create redirects to sign_in" do
      expect {
        post :create, country: attributes_for(:country)
      }.to_not change{Country.count}
      expect(response).to redirect_to new_school_session_url
    end

    it "#new redirects to sign_in" do
      get :new
      expect(response).to redirect_to new_school_session_url
    end

    it "#edit redirects to sign_in" do
      get :edit, id: 1
      expect(response).to redirect_to new_school_session_url
    end

    it "#show redirects to sign_in" do
      get :show, id: 1
      expect(response).to redirect_to new_school_session_url
    end

    it "#update redirects to sign_in" do
      put :update, id: country.id, country: { name: "France" }
      expect(response).to redirect_to new_school_session_url
      country.reload
      expect(country.name).not_to eq("France")
    end

    it "delete redirects to sign_in" do
      expect {
        delete :destroy, id: 1
      }.to_not change{Country.count}
      expect(response).to redirect_to new_school_session_url
    end
  end

  describe "non admin school" do
    before :each do
      sign_in create(:school)
    end

    it "#index redirects to root_url" do
      get :index
      expect(response).to redirect_to root_url
    end

    it "#create redirects to root_url" do
      expect {
        post :create, country: attributes_for(:country)
      }.to_not change{Country.count}
      expect(response).to redirect_to root_url
    end

    it "#new redirects to root_url" do
      get :new
      expect(response).to redirect_to root_url
    end

    it "#edit redirects to root_url" do
      get :edit, id: 1
      expect(response).to redirect_to root_url
    end

    it "#show redirects to root_url" do
      get :show, id: 1
      expect(response).to redirect_to root_url
    end

    it "#update redirects to root_url" do
      put :update, id: country.id, country: { name: "France" }
      expect(response).to redirect_to root_url
      country.reload
      expect(country.name).not_to eq("France")
    end

    it "delete redirects to root_url" do
      expect {
        delete :destroy, id: 1
      }.to_not change{Country.count}
      expect(response).to redirect_to root_url
    end
  end
end
