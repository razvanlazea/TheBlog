require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    # get :new
    assert_response :success
  end

  test "should get create" do
    post :create, {post: {content: 'con', image: []}}
    assert_response :redirect
  end 

end
