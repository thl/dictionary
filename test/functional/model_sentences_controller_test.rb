require File.dirname(__FILE__) + '/../test_helper'
require 'model_sentences_controller'

# Re-raise errors caught by the controller.
class ModelSentencesController; def rescue_action(e) raise e end; end

class ModelSentencesControllerTest < Test::Unit::TestCase
  fixtures :model_sentences

  def setup
    @controller = ModelSentencesController.new
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

    assert_not_nil assigns(:model_sentences)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:model_sentence)
    assert assigns(:model_sentence).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:model_sentence)
  end

  def test_create
    num_model_sentences = ModelSentence.count

    post :create, :model_sentence => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_model_sentences + 1, ModelSentence.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:model_sentence)
    assert assigns(:model_sentence).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil ModelSentence.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      ModelSentence.find(1)
    }
  end
end
