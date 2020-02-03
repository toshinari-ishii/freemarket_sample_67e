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
    postcode              {"542-0076"}
    prefecture            {"大阪府"}
    city                  {"大阪市中央区"}
    block                 {"難波５丁目１−６０"}
    room                  {"なんばスカイオ１５階"}
    phone_number          {"050-3187-3522"}
  end
end