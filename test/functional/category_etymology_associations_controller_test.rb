require 'test_helper'

class CategoryEtymologyAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_etymology_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_etymology_association" do
    assert_difference('CategoryEtymologyAssociation.count') do
      post :create, :category_etymology_association => { }
    end

    assert_redirected_to category_etymology_association_path(assigns(:category_etymology_association))
  end

  test "should show category_etymology_association" do
    get :show, :id => category_etymology_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => category_etymology_associations(:one).to_param
    assert_response :success
  end

  test "should update category_etymology_association" do
    put :update, :id => category_etymology_associations(:one).to_param, :category_etymology_association => { }
    assert_redirected_to category_etymology_association_path(assigns(:category_etymology_association))
  end

  test "should destroy category_etymology_association" do
    assert_difference('CategoryEtymologyAssociation.count', -1) do
      delete :destroy, :id => category_etymology_associations(:one).to_param
    end

    assert_redirected_to category_etymology_associations_path
  end
end
