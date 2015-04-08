require 'test_helper'

class UrlTypesControllerTest < ActionController::TestCase
  setup do
    @url_type = url_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:url_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url_type" do
    assert_difference('UrlType.count') do
      post :create, url_type: { name: @url_type.name }
    end

    assert_redirected_to url_type_path(assigns(:url_type))
  end

  test "should show url_type" do
    get :show, id: @url_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @url_type
    assert_response :success
  end

  test "should update url_type" do
    patch :update, id: @url_type, url_type: { name: @url_type.name }
    assert_redirected_to url_type_path(assigns(:url_type))
  end

  test "should destroy url_type" do
    assert_difference('UrlType.count', -1) do
      delete :destroy, id: @url_type
    end

    assert_redirected_to url_types_path
  end
end
