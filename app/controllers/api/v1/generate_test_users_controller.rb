class Api::V1::GenerateTestUsersController < ApplicationController
  def generate_test_users
    Faker::Config.locale = 'ja'
    test_user_name = Faker::Name.name
    test_users = { "name": test_user_name }
    render json: test_users
  end
end
