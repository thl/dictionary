require File.dirname(__FILE__) + '/../test_helper'
require 'term_types_controller'

# Re-raise errors caught by the controller.
class TermTypesController; def rescue_action(e) raise e end; end

class TermTypesControllerTest < Test::Unit::TestCase
  fixtures :term_types

  def setup
    @controller = TermTypesController.new
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

    assert_not_nil assigns(:term_types)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:term_type)
    assert assigns(:term_type).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:term_type)
  end

  def test_create
    num_term_types = TermType.count

    post :create, :term_type => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_term_types + 1, TermType.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:term_type)
    assert assigns(:term_type).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil TermType.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      TermType.find(1)
    }
  end
end
