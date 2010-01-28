require File.dirname(__FILE__) + '/../test_helper'
require 'spelling_specific_dialects_controller'

# Re-raise errors caught by the controller.
class SpellingSpecificDialectsController; def rescue_action(e) raise e end; end

class SpellingSpecificDialectsControllerTest < Test::Unit::TestCase
  fixtures :spelling_specific_dialects

  def setup
    @controller = SpellingSpecificDialectsController.new
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

    assert_not_nil assigns(:spelling_specific_dialects)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:spelling_specific_dialect)
    assert assigns(:spelling_specific_dialect).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:spelling_specific_dialect)
  end

  def test_create
    num_spelling_specific_dialects = SpellingSpecificDialect.count

    post :create, :spelling_specific_dialect => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_spelling_specific_dialects + 1, SpellingSpecificDialect.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:spelling_specific_dialect)
    assert assigns(:spelling_specific_dialect).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil SpellingSpecificDialect.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      SpellingSpecificDialect.find(1)
    }
  end
end
