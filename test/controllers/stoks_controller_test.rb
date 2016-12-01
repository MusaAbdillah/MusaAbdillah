require 'test_helper'

class StoksControllerTest < ActionController::TestCase
  setup do
    @stok = stoks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stoks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stok" do
    assert_difference('Stok.count') do
      post :create, stok: {  }
    end

    assert_redirected_to stok_path(assigns(:stok))
  end

  test "should show stok" do
    get :show, id: @stok
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stok
    assert_response :success
  end

  test "should update stok" do
    patch :update, id: @stok, stok: {  }
    assert_redirected_to stok_path(assigns(:stok))
  end

  test "should destroy stok" do
    assert_difference('Stok.count', -1) do
      delete :destroy, id: @stok
    end

    assert_redirected_to stoks_path
  end
end
