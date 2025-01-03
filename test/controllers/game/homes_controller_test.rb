require "test_helper"

class Game::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get game_homes_top_url
    assert_response :success
  end
end
