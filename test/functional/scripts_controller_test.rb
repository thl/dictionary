require File.dirname(__FILE__) + '/../test_helper'
require 'scripts_controller'

# Re-raise errors caught by the controller.
class ScriptsController; def rescue_action(e) raise e end; end

class ScriptsControllerTest < Test::Unit::TestCase
  fixtures :scripts

  def setup
    @controller = ScriptsController.new
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

    assert_not_nil assigns(:scripts)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:script)
    assert assigns(:script).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:script)
  end

  def test_create
    num_scripts = Script.count

    post :create, :script => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_scripts + 1, Script.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:script)
    assert assigns(:script).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Script.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Script.find(1)
    }
  end
end
