require File.dirname(__FILE__) + '/../test_helper'
require 'major_dialects_controller'

# Re-raise errors caught by the controller.
class MajorDialectsController; def rescue_action(e) raise e end; end

class MajorDialectsControllerTest < Test::Unit::TestCase
  fixtures :major_dialects

  def setup
    @controller = MajorDialectsController.new
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

    assert_not_nil assigns(:major_dialects)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:major_dialect)
    assert assigns(:major_dialect).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:major_dialect)
  end

  def test_create
    num_major_dialects = MajorDialect.count

    post :create, :major_dialect => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_major_dialects + 1, MajorDialect.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:major_dialect)
    assert assigns(:major_dialect).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil MajorDialect.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      MajorDialect.find(1)
    }
  end
end
