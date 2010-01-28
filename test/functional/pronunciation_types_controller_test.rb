require File.dirname(__FILE__) + '/../test_helper'
require 'pronunciation_types_controller'

# Re-raise errors caught by the controller.
class PronunciationTypesController; def rescue_action(e) raise e end; end

class PronunciationTypesControllerTest < Test::Unit::TestCase
  fixtures :pronunciation_types

  def setup
    @controller = PronunciationTypesController.new
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

    assert_not_nil assigns(:pronunciation_types)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:pronunciation_type)
    assert assigns(:pronunciation_type).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:pronunciation_type)
  end

  def test_create
    num_pronunciation_types = PronunciationType.count

    post :create, :pronunciation_type => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_pronunciation_types + 1, PronunciationType.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:pronunciation_type)
    assert assigns(:pronunciation_type).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil PronunciationType.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      PronunciationType.find(1)
    }
  end
end
