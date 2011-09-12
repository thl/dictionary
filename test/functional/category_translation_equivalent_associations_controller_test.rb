require 'test_helper'

class CategoryTranslationEquivalentAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_translation_equivalent_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_translation_equivalent_association" do
    assert_difference('CategoryTranslationEquivalentAssociation.count') do
      post :create, :category_translation_equivalent_association => { }
    end

    assert_redirected_to category_translation_equivalent_association_path(assigns(:category_translation_equivalent_association))
  end

  test "should show category_translation_equivalent_association" do
    get :show, :id => category_translation_equivalent_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => category_translation_equivalent_associations(:one).to_param
    assert_response :success
  end

  test "should update category_translation_equivalent_association" do
    put :update, :id => category_translation_equivalent_associations(:one).to_param, :category_translation_equivalent_association => { }
    assert_redirected_to category_translation_equivalent_association_path(assigns(:category_translation_equivalent_association))
  end

  test "should destroy category_translation_equivalent_association" do
    assert_difference('CategoryTranslationEquivalentAssociation.count', -1) do
      delete :destroy, :id => category_translation_equivalent_associations(:one).to_param
    end

    assert_redirected_to category_translation_equivalent_associations_path
  end
end
