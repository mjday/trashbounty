require 'test_helper'

class VerificationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get verification_new_url
    assert_response :success
  end

end
