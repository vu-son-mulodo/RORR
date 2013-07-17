require 'test_helper'

class TopControllerTest < ActionController::TestCase
  test "Top pages" do
    get :index
    assert_response :success
  end

end
