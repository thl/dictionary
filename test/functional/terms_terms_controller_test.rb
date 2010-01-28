require File.dirname(__FILE__) + '/../test_helper'
require 'terms_terms_controller'

# Re-raise errors caught by the controller.
class TermsTermsController; def rescue_action(e) raise e end; end

class TermsTermsControllerTest < Test::Unit::TestCase
  fixtures :terms_terms

  def setup
    @controller = TermsTermsController.new
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

    assert_not_nil assigns(:terms_terms)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:terms_term)
    assert assigns(:terms_term).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:terms_term)
  end

  def test_create
    num_terms_terms = TermsTerm.count

    post :create, :terms_term => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_terms_terms + 1, TermsTerm.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:terms_term)
    assert assigns(:terms_term).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil TermsTerm.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      TermsTerm.find(1)
    }
  end
end
