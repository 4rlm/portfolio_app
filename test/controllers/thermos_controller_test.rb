require 'test_helper'

class ThermosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thermo = thermos(:one)
  end

  test "should get index" do
    get thermos_url
    assert_response :success
  end

  test "should get new" do
    get new_thermo_url
    assert_response :success
  end

  test "should create thermo" do
    assert_difference('Thermo.count') do
      post thermos_url, params: { thermo: {  } }
    end

    assert_redirected_to thermo_url(Thermo.last)
  end

  test "should show thermo" do
    get thermo_url(@thermo)
    assert_response :success
  end

  test "should get edit" do
    get edit_thermo_url(@thermo)
    assert_response :success
  end

  test "should update thermo" do
    patch thermo_url(@thermo), params: { thermo: {  } }
    assert_redirected_to thermo_url(@thermo)
  end

  test "should destroy thermo" do
    assert_difference('Thermo.count', -1) do
      delete thermo_url(@thermo)
    end

    assert_redirected_to thermos_url
  end
end
