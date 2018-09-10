require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post tags_path
    assert_response :success
  end

end
