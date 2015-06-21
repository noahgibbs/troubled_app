require 'test_helper'

class DelaysControllerTest < ActionController::TestCase
  test "should get idle" do
    get :idle
    assert_response :success
  end

  test "should get busy_ruby" do
    get :busy_ruby
    assert_response :success
  end

  test "should get database" do
    get :database
    assert_response :success
  end

  test "should get occasional" do
    get :occasional
    assert_response :success
  end

  test "should get garbage" do
    get :garbage
    assert_response :success
  end

end
