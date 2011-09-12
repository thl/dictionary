require 'test_helper'

class CategoryModelSentenceAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_model_sentence_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_model_sentence_association" do
    assert_difference('CategoryModelSentenceAssociation.count') do
      post :create, :category_model_sentence_association => { }
    end

    assert_redirected_to category_model_sentence_association_path(assigns(:category_model_sentence_association))
  end

  test "should show category_model_sentence_association" do
    get :show, :id => category_model_sentence_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => category_model_sentence_associations(:one).to_param
    assert_response :success
  end

  test "should update category_model_sentence_association" do
    put :update, :id => category_model_sentence_associations(:one).to_param, :category_model_sentence_association => { }
    assert_redirected_to category_model_sentence_association_path(assigns(:category_model_sentence_association))
  end

  test "should destroy category_model_sentence_association" do
    assert_difference('CategoryModelSentenceAssociation.count', -1) do
      delete :destroy, :id => category_model_sentence_associations(:one).to_param
    end

    assert_redirected_to category_model_sentence_associations_path
  end
end
