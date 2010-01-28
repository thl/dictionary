require File.dirname(__FILE__) + '/../test_helper'
require 'metas_controller'

# Re-raise errors caught by the controller.
class MetasController; def rescue_action(e) raise e end; end

class MetasControllerTest < Test::Unit::TestCase
  fixtures :metas

  def setup
    @controller = MetasController.new
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

    assert_not_nil assigns(:metas)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:meta)
    assert assigns(:meta).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:meta)
  end

  def test_create
    num_metas = Meta.count

    post :create, :meta => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_metas + 1, Meta.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:meta)
    assert assigns(:meta).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Meta.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Meta.find(1)
    }
  end
end
