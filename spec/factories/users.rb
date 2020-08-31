FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password { password }
    password_confirmation { password }
    first_name{'太郎'}
    family_name{'小林'}
    first_kana{'タロウ'}
    family_kana{'コバヤシ'}
    date{'1996/08/01'}
  end
end
