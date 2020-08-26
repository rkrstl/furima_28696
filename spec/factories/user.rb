FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    first_name            {"岩本"}
    last_name             {"梨花"}
    first_name_kana       {"カナ"}
    last_name_kana         {"カナ"}
    birth                 {"1997-07-14"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
