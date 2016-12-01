require 'test_helper'

class KategorisControllerTest < ActionController::TestCase
  setup do
    @kategori = kategoris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kategoris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kategori" do
    assert_difference('Kategori.count') do
      post :create, kategori: {  }
    end

    assert_redirected_to kategori_path(assigns(:kategori))
  end

  test "should show kategori" do
    get :show, id: @kategori
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kategori
    assert_response :success
  end

  test "should update kategori" do
    patch :update, id: @kategori, kategori: {  }
    assert_redirected_to kategori_path(assigns(:kategori))
  end

  test "should destroy kategori" do
    assert_difference('Kategori.count', -1) do
      delete :destroy, id: @kategori
    end

    assert_redirected_to kategoris_path
  end
end
