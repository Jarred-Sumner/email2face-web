require 'test_helper'

class FacesControllerTest < ActionController::TestCase
  setup do
    @face = faces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create face" do
    assert_difference('Face.count') do
      post :create, face: { email: @face.email, url: @face.url }
    end

    assert_redirected_to face_path(assigns(:face))
  end

  test "should show face" do
    get :show, id: @face
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @face
    assert_response :success
  end

  test "should update face" do
    put :update, id: @face, face: { email: @face.email, url: @face.url }
    assert_redirected_to face_path(assigns(:face))
  end

  test "should destroy face" do
    assert_difference('Face.count', -1) do
      delete :destroy, id: @face
    end

    assert_redirected_to faces_path
  end
end
