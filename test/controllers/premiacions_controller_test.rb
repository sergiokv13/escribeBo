require 'test_helper'

class PremiacionsControllerTest < ActionController::TestCase
  setup do
    @premiacion = premiacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:premiacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create premiacion" do
    assert_difference('Premiacion.count') do
      post :create, premiacion: { date_of: @premiacion.date_of, title: @premiacion.title, user_id: @premiacion.user_id }
    end

    assert_redirected_to premiacion_path(assigns(:premiacion))
  end

  test "should show premiacion" do
    get :show, id: @premiacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @premiacion
    assert_response :success
  end

  test "should update premiacion" do
    patch :update, id: @premiacion, premiacion: { date_of: @premiacion.date_of, title: @premiacion.title, user_id: @premiacion.user_id }
    assert_redirected_to premiacion_path(assigns(:premiacion))
  end

  test "should destroy premiacion" do
    assert_difference('Premiacion.count', -1) do
      delete :destroy, id: @premiacion
    end

    assert_redirected_to premiacions_path
  end
end
