require File.dirname(__FILE__) + '/../test_helper'
require 'model_sentence_types_controller'

# Re-raise errors caught by the controller.
class ModelSentenceTypesController; def rescue_action(e) raise e end; end

class ModelSentenceTypesControllerTest < Test::Unit::TestCase
  fixtures :model_sentence_types

  def setup
    @controller = ModelSentenceTypesController.new
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

    assert_not_nil assigns(:model_sentence_types)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:model_sentence_type)
    assert assigns(:model_sentence_type).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:model_sentence_type)
  end

  def test_create
    num_model_sentence_types = ModelSentenceType.count

    post :create, :model_sentence_type => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_model_sentence_types + 1, ModelSentenceType.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:model_sentence_type)
    assert assigns(:model_sentence_type).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil ModelSentenceType.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      ModelSentenceType.find(1)
    }
  end
end
