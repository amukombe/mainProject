require 'test_helper'

class CaricullumsControllerTest < ActionController::TestCase
  setup do
    @caricullum = caricullums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caricullums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caricullum" do
    assert_difference('Caricullum.count') do
      post :create, caricullum: @caricullum.attributes
    end

    assert_redirected_to caricullum_path(assigns(:caricullum))
  end

  test "should show caricullum" do
    get :show, id: @caricullum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caricullum
    assert_response :success
  end

  test "should update caricullum" do
    put :update, id: @caricullum, caricullum: @caricullum.attributes
    assert_redirected_to caricullum_path(assigns(:caricullum))
  end

  test "should destroy caricullum" do
    assert_difference('Caricullum.count', -1) do
      delete :destroy, id: @caricullum
    end

    assert_redirected_to caricullums_path
  end
end
