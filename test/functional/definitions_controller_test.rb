require File.dirname(__FILE__) + '/../test_helper'
require 'definitions_controller'

# Re-raise errors caught by the controller.
class DefinitionsController; def rescue_action(e) raise e end; end

class DefinitionsControllerTest < Test::Unit::TestCase
  fixtures :definitions

  def setup
    @controller = DefinitionsController.new
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

    assert_not_nil assigns(:definitions)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:definition)
    assert assigns(:definition).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:definition)
  end

  def test_create
    num_definitions = Definition.count

    post :create, :definition => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_definitions + 1, Definition.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:definition)
    assert assigns(:definition).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Definition.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Definition.find(1)
    }
  end
end
