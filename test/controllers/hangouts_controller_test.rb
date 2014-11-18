require 'test_helper'

class HangoutsControllerTest < ActionController::TestCase
  setup do
    @hangout = hangouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hangouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hangout" do
    assert_difference('Hangout.count') do
      post :create, hangout: { language_id: @hangout.language_id, name: @hangout.name, post_id: @hangout.post_id, private: @hangout.private }
    end

    assert_redirected_to hangout_path(assigns(:hangout))
  end

  test "should show hangout" do
    get :show, id: @hangout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hangout
    assert_response :success
  end

  test "should update hangout" do
    patch :update, id: @hangout, hangout: { language_id: @hangout.language_id, name: @hangout.name, post_id: @hangout.post_id, private: @hangout.private }
    assert_redirected_to hangout_path(assigns(:hangout))
  end

  test "should destroy hangout" do
    assert_difference('Hangout.count', -1) do
      delete :destroy, id: @hangout
    end

    assert_redirected_to hangouts_path
  end
end
