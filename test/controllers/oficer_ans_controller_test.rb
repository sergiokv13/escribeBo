require 'test_helper'

class OficerAnsControllerTest < ActionController::TestCase
  setup do
    @oficer_an = oficer_ans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:oficer_ans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oficer_an" do
    assert_difference('OficerAn.count') do
      post :create, oficer_an: { deadline: @oficer_an.deadline, text: @oficer_an.text, title: @oficer_an.title }
    end

    assert_redirected_to oficer_an_path(assigns(:oficer_an))
  end

  test "should show oficer_an" do
    get :show, id: @oficer_an
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @oficer_an
    assert_response :success
  end

  test "should update oficer_an" do
    patch :update, id: @oficer_an, oficer_an: { deadline: @oficer_an.deadline, text: @oficer_an.text, title: @oficer_an.title }
    assert_redirected_to oficer_an_path(assigns(:oficer_an))
  end

  test "should destroy oficer_an" do
    assert_difference('OficerAn.count', -1) do
      delete :destroy, id: @oficer_an
    end

    assert_redirected_to oficer_ans_path
  end
end
