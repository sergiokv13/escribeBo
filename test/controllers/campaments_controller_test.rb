require 'test_helper'

class CampamentsControllerTest < ActionController::TestCase
  setup do
    @campament = campaments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campaments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campament" do
    assert_difference('Campament.count') do
      post :create, campament: { name: @campament.name, president_id: @campament.president_id }
    end

    assert_redirected_to campament_path(assigns(:campament))
  end

  test "should show campament" do
    get :show, id: @campament
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campament
    assert_response :success
  end

  test "should update campament" do
    patch :update, id: @campament, campament: { name: @campament.name, president_id: @campament.president_id }
    assert_redirected_to campament_path(assigns(:campament))
  end

  test "should destroy campament" do
    assert_difference('Campament.count', -1) do
      delete :destroy, id: @campament
    end

    assert_redirected_to campaments_path
  end
end
