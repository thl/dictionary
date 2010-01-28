require File.dirname(__FILE__) + '/../test_helper'
require 'literary_forms_controller'

# Re-raise errors caught by the controller.
class LiteraryFormsController; def rescue_action(e) raise e end; end

class LiteraryFormsControllerTest < Test::Unit::TestCase
  fixtures :literary_forms

  def setup
    @controller = LiteraryFormsController.new
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

    assert_not_nil assigns(:literary_forms)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:literary_form)
    assert assigns(:literary_form).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:literary_form)
  end

  def test_create
    num_literary_forms = LiteraryForm.count

    post :create, :literary_form => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_literary_forms + 1, LiteraryForm.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:literary_form)
    assert assigns(:literary_form).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil LiteraryForm.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      LiteraryForm.find(1)
    }
  end
end
