require 'test_helper'

class TroubelsControllerTest < ActionController::TestCase
  setup do
    @troubel = troubels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:troubels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create troubel" do
    assert_difference('Troubel.count') do
      post :create, troubel: {  }
    end

    assert_redirected_to troubel_path(assigns(:troubel))
  end

  test "should show troubel" do
    get :show, id: @troubel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @troubel
    assert_response :success
  end

  test "should update troubel" do
    patch :update, id: @troubel, troubel: {  }
    assert_redirected_to troubel_path(assigns(:troubel))
  end

  test "should destroy troubel" do
    assert_difference('Troubel.count', -1) do
      delete :destroy, id: @troubel
    end

    assert_redirected_to troubels_path
  end
end
