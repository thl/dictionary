require File.dirname(__FILE__) + '/../test_helper'
require 'defs_controller'

# Re-raise errors caught by the controller.
class DefsController; def rescue_action(e) raise e end; end

class DefsControllerTest < Test::Unit::TestCase
  fixtures :defs

  def setup
    @controller = DefsController.new
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

    assert_not_nil assigns(:defs)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:def)
    assert assigns(:def).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:def)
  end

  def test_create
    num_defs = Def.count

    post :create, :def => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_defs + 1, Def.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:def)
    assert assigns(:def).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Def.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Def.find(1)
    }
  end
end
