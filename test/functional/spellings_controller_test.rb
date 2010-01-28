require File.dirname(__FILE__) + '/../test_helper'
require 'spellings_controller'

# Re-raise errors caught by the controller.
class SpellingsController; def rescue_action(e) raise e end; end

class SpellingsControllerTest < Test::Unit::TestCase
  fixtures :spellings

  def setup
    @controller = SpellingsController.new
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

    assert_not_nil assigns(:spellings)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:spelling)
    assert assigns(:spelling).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:spelling)
  end

  def test_create
    num_spellings = Spelling.count

    post :create, :spelling => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_spellings + 1, Spelling.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:spelling)
    assert assigns(:spelling).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Spelling.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Spelling.find(1)
    }
  end
end
