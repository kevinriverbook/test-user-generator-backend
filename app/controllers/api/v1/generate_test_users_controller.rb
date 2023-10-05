class Api::V1::GenerateTestUsersController < ApplicationController
  def generate_test_users
    Faker::Config.locale = 'ja'
    test_users = Faker::Name.name
    render json: test_users
  end
end
