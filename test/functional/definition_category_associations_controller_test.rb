require 'test_helper'

class DefinitionCategoryAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:definition_category_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create definition_category_association" do
    assert_difference('DefinitionCategoryAssociation.count') do
      post :create, :definition_category_association => { }
    end

    assert_redirected_to definition_category_association_path(assigns(:definition_category_association))
  end

  test "should show definition_category_association" do
    get :show, :id => definition_category_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => definition_category_associations(:one).to_param
    assert_response :success
  end

  test "should update definition_category_association" do
    put :update, :id => definition_category_associations(:one).to_param, :definition_category_association => { }
    assert_redirected_to definition_category_association_path(assigns(:definition_category_association))
  end

  test "should destroy definition_category_association" do
    assert_difference('DefinitionCategoryAssociation.count', -1) do
      delete :destroy, :id => definition_category_associations(:one).to_param
    end

    assert_redirected_to definition_category_associations_path
  end
end
