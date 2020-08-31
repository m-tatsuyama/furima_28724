FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    birthday              { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            {"佐藤"}
    first_name_reading    {"カタカナ"}
    last_name             {"太郎"}
    last_name_reading     {"カタカナ"}
  end
end
