require 'test_helper'

class CategorySpellingAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_spelling_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_spelling_association" do
    assert_difference('CategorySpellingAssociation.count') do
      post :create, :category_spelling_association => { }
    end

    assert_redirected_to category_spelling_association_path(assigns(:category_spelling_association))
  end

  test "should show category_spelling_association" do
    get :show, :id => category_spelling_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => category_spelling_associations(:one).to_param
    assert_response :success
  end

  test "should update category_spelling_association" do
    put :update, :id => category_spelling_associations(:one).to_param, :category_spelling_association => { }
    assert_redirected_to category_spelling_association_path(assigns(:category_spelling_association))
  end

  test "should destroy category_spelling_association" do
    assert_difference('CategorySpellingAssociation.count', -1) do
      delete :destroy, :id => category_spelling_associations(:one).to_param
    end

    assert_redirected_to category_spelling_associations_path
  end
end
