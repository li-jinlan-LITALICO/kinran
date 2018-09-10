require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

 #無くて良い機能
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  # test "valid signup information" do
  #   get signup_path
  #   assert_difference 'User.count', 1 do
  #     post users_path, params: { user: { name:  "Example User",
  #                                        email: "user@example.com",
  #                                        password:              "password",
  #                                        password_confirmation: "password" },
  #                                        postal_code: '1111111',
  #                                        address: '東京都中目黒3-3-1 GTタワー',
  #                                        phone_number: '777777777'}
  #   end
  #   follow_redirect!
  #   assert_template 'items/index'
  # end
end
