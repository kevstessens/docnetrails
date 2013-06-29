require 'test_helper'

class MedicalSpecificationsControllerTest < ActionController::TestCase
  setup do
    @medical_specification = medical_specifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_specifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_specification" do
    assert_difference('MedicalSpecification.count') do
      post :create, medical_specification: { name: @medical_specification.name }
    end

    assert_redirected_to medical_specification_path(assigns(:medical_specification))
  end

  test "should show medical_specification" do
    get :show, id: @medical_specification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_specification
    assert_response :success
  end

  test "should update medical_specification" do
    put :update, id: @medical_specification, medical_specification: { name: @medical_specification.name }
    assert_redirected_to medical_specification_path(assigns(:medical_specification))
  end

  test "should destroy medical_specification" do
    assert_difference('MedicalSpecification.count', -1) do
      delete :destroy, id: @medical_specification
    end

    assert_redirected_to medical_specifications_path
  end
end
