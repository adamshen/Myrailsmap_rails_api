require 'test_helper'

class UserIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should get token" do
    post api_user_session_url, params: {
        email: @user.email,
        password: @user.password,
    }

    assert @response.header.has_key?("access-token")
  end
end
