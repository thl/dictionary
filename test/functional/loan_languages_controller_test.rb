require File.dirname(__FILE__) + '/../test_helper'
require 'loan_languages_controller'

# Re-raise errors caught by the controller.
class LoanLanguagesController; def rescue_action(e) raise e end; end

class LoanLanguagesControllerTest < Test::Unit::TestCase
  fixtures :loan_languages

  def setup
    @controller = LoanLanguagesController.new
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

    assert_not_nil assigns(:loan_languages)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:loan_language)
    assert assigns(:loan_language).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:loan_language)
  end

  def test_create
    num_loan_languages = LoanLanguage.count

    post :create, :loan_language => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_loan_languages + 1, LoanLanguage.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:loan_language)
    assert assigns(:loan_language).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil LoanLanguage.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      LoanLanguage.find(1)
    }
  end
end
