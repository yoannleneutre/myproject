require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get newpatient" do
    get :newpatient
    assert_response :success
  end

  test "should get createpatient" do
    get :createpatient
    assert_response :success
  end

  test "should get destroypatient" do
    get :destroypatient
    assert_response :success
  end

end
