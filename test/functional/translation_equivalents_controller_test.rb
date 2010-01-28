require File.dirname(__FILE__) + '/../test_helper'
require 'translation_equivalents_controller'

# Re-raise errors caught by the controller.
class TranslationEquivalentsController; def rescue_action(e) raise e end; end

class TranslationEquivalentsControllerTest < Test::Unit::TestCase
  fixtures :translation_equivalents

  def setup
    @controller = TranslationEquivalentsController.new
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

    assert_not_nil assigns(:translation_equivalents)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:translation_equivalent)
    assert assigns(:translation_equivalent).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:translation_equivalent)
  end

  def test_create
    num_translation_equivalents = TranslationEquivalent.count

    post :create, :translation_equivalent => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_translation_equivalents + 1, TranslationEquivalent.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:translation_equivalent)
    assert assigns(:translation_equivalent).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil TranslationEquivalent.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      TranslationEquivalent.find(1)
    }
  end
end
