require 'rails_helper'

RSpec.describe Admin::LanguagesController, type: :controller do

  before :each do
    sign_in create(:admin_school)
  end

  describe "GET #index" do
    it "lists all languages" do
      language = create(:language)
      get :index
      expect(assigns(:languages).length).to_not eq(0)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested language as @language" do
      language = create(:language)
      get :show, {id: language.id}
      expect(assigns(:language)).to eq(language)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new language as @language" do
      get :new
      expect(assigns(:language)).to be_a_new(Language)
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "renders the edit view" do
      language = create(:language)
      get :edit, :id => language.id
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a language" do
        expect {
          post :create, language: attributes_for(:language)
        }.to change(Language, :count).by(1)
        expect(assigns(:language)).to be_a(Language)
        expect(response).to redirect_to(admin_language_url(Language.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_language as @admin_language" do
        expect {
          post :create, language: attributes_for(:invalid_language)
        }.to_not change{Language.count}
        expect(assigns(:language)).to be_a_new(Language)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    let!(:language) { create(:language) }
    context "with valid params" do
      it "updates the requested language" do
        put :update, id: language.id, language: { name: "French123" }
        expect(response).to redirect_to(admin_language_url(language))
        expect(assigns(:language)).to eq(language)
        language.reload
        expect(language.name).to eq("French123")
      end
    end

    context "with invalid params" do
      it "does not update the requested language" do
        put :update, id: language.id, language: { name: ""}
        expect(response).to render_template(:edit)
        language.reload
        expect(assigns(language.name)).not_to eq("")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested language" do
      language = create(:language)
      expect {
        delete :destroy, :id => language.id
      }.to change{Language.count}.by(-1)
      expect(response).to redirect_to(admin_languages_url)
    end
  end
end
