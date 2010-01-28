require File.dirname(__FILE__) + '/../test_helper'
require 'specific_dialects_controller'

# Re-raise errors caught by the controller.
class SpecificDialectsController; def rescue_action(e) raise e end; end

class SpecificDialectsControllerTest < Test::Unit::TestCase
  fixtures :specific_dialects

  def setup
    @controller = SpecificDialectsController.new
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

    assert_not_nil assigns(:specific_dialects)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:specific_dialect)
    assert assigns(:specific_dialect).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:specific_dialect)
  end

  def test_create
    num_specific_dialects = SpecificDialect.count

    post :create, :specific_dialect => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_specific_dialects + 1, SpecificDialect.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:specific_dialect)
    assert assigns(:specific_dialect).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil SpecificDialect.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      SpecificDialect.find(1)
    }
  end
end
