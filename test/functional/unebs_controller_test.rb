require 'test_helper'

class UnebsControllerTest < ActionController::TestCase
  setup do
    @uneb = unebs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unebs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uneb" do
    assert_difference('Uneb.count') do
      post :create, uneb: @uneb.attributes
    end

    assert_redirected_to uneb_path(assigns(:uneb))
  end

  test "should show uneb" do
    get :show, id: @uneb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uneb
    assert_response :success
  end

  test "should update uneb" do
    put :update, id: @uneb, uneb: @uneb.attributes
    assert_redirected_to uneb_path(assigns(:uneb))
  end

  test "should destroy uneb" do
    assert_difference('Uneb.count', -1) do
      delete :destroy, id: @uneb
    end

    assert_redirected_to unebs_path
  end
end
