require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should get index:get" do
    get :index:get
    assert_response :success
  end

  test "should get show:get" do
    get :show:get
    assert_response :success
  end

  test "should get create:post" do
    get :create:post
    assert_response :success
  end

  test "should get edit:get" do
    get :edit:get
    assert_response :success
  end

  test "should get update:patch" do
    get :update:patch
    assert_response :success
  end

  test "should get destroy:delete" do
    get :destroy:delete
    assert_response :success
  end

  test "should get new:get" do
    get :new:get
    assert_response :success
  end

end
