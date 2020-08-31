FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password { password }
    password_confirmation { password }
    first_name{first_name}
    family_name{family_name}
    first_kana{first_kana}
    family_kana{family_kana}
    date{date}
  end
end
