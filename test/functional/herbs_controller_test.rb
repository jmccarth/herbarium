require 'test_helper'

class HerbsControllerTest < ActionController::TestCase
  setup do
    @herb = herbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:herbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create herb" do
    assert_difference('Herb.count') do
      post :create, herb: @herb.attributes
    end

    assert_redirected_to herb_path(assigns(:herb))
  end

  test "should show herb" do
    get :show, id: @herb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @herb
    assert_response :success
  end

  test "should update herb" do
    put :update, id: @herb, herb: @herb.attributes
    assert_redirected_to herb_path(assigns(:herb))
  end

  test "should destroy herb" do
    assert_difference('Herb.count', -1) do
      delete :destroy, id: @herb
    end

    assert_redirected_to herbs_path
  end
end
