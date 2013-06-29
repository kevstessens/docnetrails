require 'test_helper'

class PrepaidMedicalsControllerTest < ActionController::TestCase
  setup do
    @prepaid_medical = prepaid_medicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prepaid_medicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prepaid_medical" do
    assert_difference('PrepaidMedical.count') do
      post :create, prepaid_medical: { name: @prepaid_medical.name }
    end

    assert_redirected_to prepaid_medical_path(assigns(:prepaid_medical))
  end

  test "should show prepaid_medical" do
    get :show, id: @prepaid_medical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prepaid_medical
    assert_response :success
  end

  test "should update prepaid_medical" do
    put :update, id: @prepaid_medical, prepaid_medical: { name: @prepaid_medical.name }
    assert_redirected_to prepaid_medical_path(assigns(:prepaid_medical))
  end

  test "should destroy prepaid_medical" do
    assert_difference('PrepaidMedical.count', -1) do
      delete :destroy, id: @prepaid_medical
    end

    assert_redirected_to prepaid_medicals_path
  end
end
