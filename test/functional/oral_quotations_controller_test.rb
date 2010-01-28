require File.dirname(__FILE__) + '/../test_helper'
require 'oral_quotations_controller'

# Re-raise errors caught by the controller.
class OralQuotationsController; def rescue_action(e) raise e end; end

class OralQuotationsControllerTest < Test::Unit::TestCase
  fixtures :oral_quotations

  def setup
    @controller = OralQuotationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:oral_quotations)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:oral_quotation)
    assert assigns(:oral_quotation).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:oral_quotation)
  end

  def test_create
    num_oral_quotations = OralQuotation.count

    post :create, :oral_quotation => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_oral_quotations + 1, OralQuotation.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:oral_quotation)
    assert assigns(:oral_quotation).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil OralQuotation.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      OralQuotation.find(1)
    }
  end
end
