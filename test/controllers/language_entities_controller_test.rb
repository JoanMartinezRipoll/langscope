require 'test_helper'

class LanguageEntitiesControllerTest < ActionController::TestCase
  setup do
    @language_entity = language_entities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:language_entities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create language_entity" do
    assert_difference('LanguageEntity.count') do
      post :create, language_entity: { country_id: @language_entity.country_id, email: @language_entity.email, name: @language_entity.name, plz: @language_entity.plz, street: @language_entity.street }
    end

    assert_redirected_to language_entity_path(assigns(:language_entity))
  end

  test "should show language_entity" do
    get :show, id: @language_entity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @language_entity
    assert_response :success
  end

  test "should update language_entity" do
    patch :update, id: @language_entity, language_entity: { country_id: @language_entity.country_id, email: @language_entity.email, name: @language_entity.name, plz: @language_entity.plz, street: @language_entity.street }
    assert_redirected_to language_entity_path(assigns(:language_entity))
  end

  test "should destroy language_entity" do
    assert_difference('LanguageEntity.count', -1) do
      delete :destroy, id: @language_entity
    end

    assert_redirected_to language_entities_path
  end
end
