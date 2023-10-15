class Api::V1::GenerateTestUsersController < ApplicationController
  def generate_test_users
    Faker::Config.locale = 'ja'
    name = Faker::Name.name
    birthday = formatDate(Faker::Date.birthday(min_age: 18, max_age: 85))
    test_users = { name: name, birthday: birthday }
    render json: test_users
  end

  private
  
    def formatDate(date)
      formatted_date = date.strftime("%Y年%-m月%-d日")
      return formatted_date
    end
end
