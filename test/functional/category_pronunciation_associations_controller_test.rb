require 'test_helper'

class CategoryPronunciationAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_pronunciation_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_pronunciation_association" do
    assert_difference('CategoryPronunciationAssociation.count') do
      post :create, :category_pronunciation_association => { }
    end

    assert_redirected_to category_pronunciation_association_path(assigns(:category_pronunciation_association))
  end

  test "should show category_pronunciation_association" do
    get :show, :id => category_pronunciation_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => category_pronunciation_associations(:one).to_param
    assert_response :success
  end

  test "should update category_pronunciation_association" do
    put :update, :id => category_pronunciation_associations(:one).to_param, :category_pronunciation_association => { }
    assert_redirected_to category_pronunciation_association_path(assigns(:category_pronunciation_association))
  end

  test "should destroy category_pronunciation_association" do
    assert_difference('CategoryPronunciationAssociation.count', -1) do
      delete :destroy, :id => category_pronunciation_associations(:one).to_param
    end

    assert_redirected_to category_pronunciation_associations_path
  end
end
