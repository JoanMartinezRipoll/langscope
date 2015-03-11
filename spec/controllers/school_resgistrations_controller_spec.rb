require 'rails_helper'

RSpec.describe Devise::RegistrationsController, type: :controller do
  FLASH_UPDATE_MSG = "Your account has been updated successfully."
  FLASH_DELETE_MSG = "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:school]
  end

  describe "GET #new" do
    it "renders the :new view" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    context "signed in school" do
      it "renders the :edit view" do
        sign_in create(:school)
        get :edit
        expect(response).to render_template(:edit)
      end
    end
    context "no sigend in school" do
      it "redirects to  the sign_in view" do
        get :edit
        expect(response).to redirect_to new_school_session_url
      end
    end
  end

  describe "POST #create" do
    it "creates a new registration" do
      expect {
        post :create, school: attributes_for(:school)
      }.to change(School,:count).by(1)
      expect(response).to redirect_to root_url
    end

    it "does not save the invalid registration" do
      expect {
        post :create, school: attributes_for(:invalid_school)
      }.to_not change(School,:count)
      expect(response).to render_template(:new)
    end
  end

  describe "PATCH #update" do
    context "signed in school" do
      before :each do
        @school = create(:school)
        sign_in @school
      end
      it 'changes @school registration data' do
        patch :update, school: { name:"Edited school", current_password:"password"}
        expect(response).to redirect_to root_url
        expect(flash[:notice]).to match(FLASH_UPDATE_MSG)
        @school.reload
        expect(@school.name).to eq("Edited school")
      end

      it 'does not save the invalid registration data' do
        # patch :update, school: attributes_for(:invalid_school).merge({current_password: "password"})
        patch :update, school: attributes_for(:invalid_school, current_password: "password")
        #patch :update, school: { name: nil, email: "no@no.com", current_password:"password"}
        expect(response).to render_template(:edit)
        @school.reload
        expect(@school.email).not_to eq("no@no.com")
      end
    end
    context "no signed in school" do
      it "redirects to  the sign_in view" do
        patch :update, school: { name:"Edited school", current_password:"password"}
        expect(response).to redirect_to new_school_session_url
      end
    end
  end

  describe "DELETE #destroy" do
    context "signed in school" do
      before :each do
        @school = create(:school)
        sign_in @school
      end
      it 'deletes the @school' do
        expect{
          delete :destroy, id: @school
        }.to change(School,:count).by(-1)
        expect(response).to redirect_to root_url
        expect(flash[:notice]).to match(FLASH_DELETE_MSG)
      end
    end
    context "no signed in school" do
      it "redirects to  the sign_in view" do
        expect {
          delete :destroy, id: @school
        }.to_not change(School,:count)
        expect(response).to redirect_to new_school_session_url
      end
    end
  end
end
