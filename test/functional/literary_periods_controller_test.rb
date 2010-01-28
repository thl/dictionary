require File.dirname(__FILE__) + '/../test_helper'
require 'literary_periods_controller'

# Re-raise errors caught by the controller.
class LiteraryPeriodsController; def rescue_action(e) raise e end; end

class LiteraryPeriodsControllerTest < Test::Unit::TestCase
  fixtures :literary_periods

  def setup
    @controller = LiteraryPeriodsController.new
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

    assert_not_nil assigns(:literary_periods)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:literary_period)
    assert assigns(:literary_period).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:literary_period)
  end

  def test_create
    num_literary_periods = LiteraryPeriod.count

    post :create, :literary_period => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_literary_periods + 1, LiteraryPeriod.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:literary_period)
    assert assigns(:literary_period).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil LiteraryPeriod.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      LiteraryPeriod.find(1)
    }
  end
end
