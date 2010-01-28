require File.dirname(__FILE__) + '/../test_helper'
require 'spelling_major_dialects_controller'

# Re-raise errors caught by the controller.
class SpellingMajorDialectsController; def rescue_action(e) raise e end; end

class SpellingMajorDialectsControllerTest < Test::Unit::TestCase
  fixtures :spelling_major_dialects

  def setup
    @controller = SpellingMajorDialectsController.new
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

    assert_not_nil assigns(:spelling_major_dialects)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:spelling_major_dialect)
    assert assigns(:spelling_major_dialect).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:spelling_major_dialect)
  end

  def test_create
    num_spelling_major_dialects = SpellingMajorDialect.count

    post :create, :spelling_major_dialect => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_spelling_major_dialects + 1, SpellingMajorDialect.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:spelling_major_dialect)
    assert assigns(:spelling_major_dialect).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil SpellingMajorDialect.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      SpellingMajorDialect.find(1)
    }
  end
end
