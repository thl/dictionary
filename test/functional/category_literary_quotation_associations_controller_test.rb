require 'test_helper'

class CategoryLiteraryQuotationAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_literary_quotation_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_literary_quotation_association" do
    assert_difference('CategoryLiteraryQuotationAssociation.count') do
      post :create, :category_literary_quotation_association => { }
    end

    assert_redirected_to category_literary_quotation_association_path(assigns(:category_literary_quotation_association))
  end

  test "should show category_literary_quotation_association" do
    get :show, :id => category_literary_quotation_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => category_literary_quotation_associations(:one).to_param
    assert_response :success
  end

  test "should update category_literary_quotation_association" do
    put :update, :id => category_literary_quotation_associations(:one).to_param, :category_literary_quotation_association => { }
    assert_redirected_to category_literary_quotation_association_path(assigns(:category_literary_quotation_association))
  end

  test "should destroy category_literary_quotation_association" do
    assert_difference('CategoryLiteraryQuotationAssociation.count', -1) do
      delete :destroy, :id => category_literary_quotation_associations(:one).to_param
    end

    assert_redirected_to category_literary_quotation_associations_path
  end
end
