require File.dirname(__FILE__) + '/../test_helper'
require 'literary_quotations_controller'

# Re-raise errors caught by the controller.
class LiteraryQuotationsController; def rescue_action(e) raise e end; end

class LiteraryQuotationsControllerTest < Test::Unit::TestCase
  fixtures :literary_quotations

  def setup
    @controller = LiteraryQuotationsController.new
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

    assert_not_nil assigns(:literary_quotations)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:literary_quotation)
    assert assigns(:literary_quotation).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:literary_quotation)
  end

  def test_create
    num_literary_quotations = LiteraryQuotation.count

    post :create, :literary_quotation => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_literary_quotations + 1, LiteraryQuotation.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:literary_quotation)
    assert assigns(:literary_quotation).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil LiteraryQuotation.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      LiteraryQuotation.find(1)
    }
  end
end
