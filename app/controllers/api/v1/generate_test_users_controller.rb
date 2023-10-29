class Api::V1::GenerateTestUsersController < ApplicationController
  def generate_test_users
    num_of_test_users = params.key?(:numOfTestUsers) ? params[:numOfTestUsers].to_i : 1
    render json: test_user(num_of_test_users)
  end

  private
    def test_user(num_of_test_users)
      Faker::Config.locale = 'ja'
      test_users = []
      num_of_test_users = num_of_test_users >= 1 && num_of_test_users <= 5 ? num_of_test_users : 1
      num_of_test_users.times do
        name = Faker::Name.name
        unformatted_birthday = Faker::Date.birthday(min_age: 18, max_age: 85)
        birthday = formatDate(unformatted_birthday)
        age = age(unformatted_birthday)
        test_users.push({ name: name, birthday: birthday, age: age })
      end
      return test_users
    end

    # e.g. "1979-06-15" -> "1979年6月15日"
    def formatDate(date)
      formatted_date = date.strftime("%Y年%-m月%-d日")
      return formatted_date
    end

    def age(birthday)
      birthday = birthday.to_time
      year_of_birth = birthday.year
      month_of_birth = birthday.month
      day_of_birth = birthday.day

      now = Time.now
      year_of_now = now.year
      month_of_now = now.month
      day_of_now = now.day

      # 短絡評価を使用している
      if (month_of_now >= month_of_birth && day_of_now >= day_of_birth)
        return year_of_now - year_of_birth
      else
        return year_of_now - year_of_birth - 1
      end
    end
end
