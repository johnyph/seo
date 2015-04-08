require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  setup do
    @result = results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post :create, result: { ad_right: @result.ad_right, ad_top: @result.ad_top, ad_total: @result.ad_total, code: @result.code, keyword_id: @result.keyword_id, simple_results: @result.simple_results, total_links: @result.total_links, total_search: @result.total_search }
    end

    assert_redirected_to result_path(assigns(:result))
  end

  test "should show result" do
    get :show, id: @result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result
    assert_response :success
  end

  test "should update result" do
    patch :update, id: @result, result: { ad_right: @result.ad_right, ad_top: @result.ad_top, ad_total: @result.ad_total, code: @result.code, keyword_id: @result.keyword_id, simple_results: @result.simple_results, total_links: @result.total_links, total_search: @result.total_search }
    assert_redirected_to result_path(assigns(:result))
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete :destroy, id: @result
    end

    assert_redirected_to results_path
  end
end
