require 'rails_helper'

RSpec.describe Admin::CountriesController, type: :controller do

  before :each do
    sign_in create(:admin_school)
  end

  describe "GET #index" do
    it "lists all countries" do
      country = create(:country)
      get :index
      expect(assigns(:countries).length).to_not eq(0)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested country as @country" do
      country = create(:country)
      get :show, {id: country.id}
      expect(assigns(:country)).to eq(country)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new country as @country" do
      get :new
      expect(assigns(:country)).to be_a_new(Country)
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "renders the edit view" do
      country = create(:country)
      get :edit, :id => country.id
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a Country" do
        expect {
          post :create, country: attributes_for(:country)
        }.to change(Country, :count).by(1)
        expect(assigns(:country)).to be_a(Country)
        expect(response).to redirect_to(admin_country_url(Country.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_country as @admin_country" do
        expect {
          post :create, country: attributes_for(:invalid_country)
        }.to_not change{Country.count}
        expect(assigns(:country)).to be_a_new(Country)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    let!(:country) { create(:country) }
    context "with valid params" do
      it "updates the requested country" do
        put :update, id: country.id, country: { name: "France123" }
        expect(response).to redirect_to(admin_country_url(country))
        expect(assigns(:country)).to eq(country)
        country.reload
        expect(country.name).to eq("France123")
      end
    end

    context "with invalid params" do
      it "does not update the requested country" do
        put :update, id: country.id, country: { name: ""}
        expect(response).to render_template(:edit)
        country.reload
        expect(assigns(country.name)).not_to eq("")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested country" do
      country = create(:country)
      expect {
        delete :destroy, :id => country.id
      }.to change{Country.count}.by(-1)
      expect(response).to redirect_to(admin_countries_url)
    end
  end
end
