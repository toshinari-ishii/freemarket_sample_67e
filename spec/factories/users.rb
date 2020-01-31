FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"賢一"}
    last_name             {"高田"}
    first_hurigana        {"けんいち"}
    last_hurigana         {"たかだ"}
    birthday              {Faker::Date.birthday}
  end

end