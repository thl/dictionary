require File.dirname(__FILE__) + '/../test_helper'
require 'language_contexts_controller'

# Re-raise errors caught by the controller.
class LanguageContextsController; def rescue_action(e) raise e end; end

class LanguageContextsControllerTest < Test::Unit::TestCase
  fixtures :language_contexts

  def setup
    @controller = LanguageContextsController.new
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

    assert_not_nil assigns(:language_contexts)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:language_context)
    assert assigns(:language_context).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:language_context)
  end

  def test_create
    num_language_contexts = LanguageContext.count

    post :create, :language_context => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_language_contexts + 1, LanguageContext.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:language_context)
    assert assigns(:language_context).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil LanguageContext.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      LanguageContext.find(1)
    }
  end
end
