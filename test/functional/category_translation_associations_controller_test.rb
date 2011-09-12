require 'test_helper'

class CategoryTranslationAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_translation_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_translation_association" do
    assert_difference('CategoryTranslationAssociation.count') do
      post :create, :category_translation_association => { }
    end

    assert_redirected_to category_translation_association_path(assigns(:category_translation_association))
  end

  test "should show category_translation_association" do
    get :show, :id => category_translation_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => category_translation_associations(:one).to_param
    assert_response :success
  end

  test "should update category_translation_association" do
    put :update, :id => category_translation_associations(:one).to_param, :category_translation_association => { }
    assert_redirected_to category_translation_association_path(assigns(:category_translation_association))
  end

  test "should destroy category_translation_association" do
    assert_difference('CategoryTranslationAssociation.count', -1) do
      delete :destroy, :id => category_translation_associations(:one).to_param
    end

    assert_redirected_to category_translation_associations_path
  end
end
