require File.dirname(__FILE__) + '/../test_helper'
require 'terms_definitions_controller'

# Re-raise errors caught by the controller.
class TermsDefinitionsController; def rescue_action(e) raise e end; end

class TermsDefinitionsControllerTest < Test::Unit::TestCase
  fixtures :terms_definitions

  def setup
    @controller = TermsDefinitionsController.new
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

    assert_not_nil assigns(:terms_definitions)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:terms_definition)
    assert assigns(:terms_definition).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:terms_definition)
  end

  def test_create
    num_terms_definitions = TermsDefinition.count

    post :create, :terms_definition => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_terms_definitions + 1, TermsDefinition.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:terms_definition)
    assert assigns(:terms_definition).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil TermsDefinition.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      TermsDefinition.find(1)
    }
  end
end
