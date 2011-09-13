require 'test_helper'

class CategoryMetaAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_meta_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_meta_association" do
    assert_difference('CategoryMetaAssociation.count') do
      post :create, :category_meta_association => { }
    end

    assert_redirected_to category_meta_association_path(assigns(:category_meta_association))
  end

  test "should show category_meta_association" do
    get :show, :id => category_meta_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => category_meta_associations(:one).to_param
    assert_response :success
  end

  test "should update category_meta_association" do
    put :update, :id => category_meta_associations(:one).to_param, :category_meta_association => { }
    assert_redirected_to category_meta_association_path(assigns(:category_meta_association))
  end

  test "should destroy category_meta_association" do
    assert_difference('CategoryMetaAssociation.count', -1) do
      delete :destroy, :id => category_meta_associations(:one).to_param
    end

    assert_redirected_to category_meta_associations_path
  end
end
