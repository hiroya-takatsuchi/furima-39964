FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6) + 'y1'}
    password_confirmation {password}
    first_name{'山田'}
    last_name{'太郎'}
    kana_first_name{'ヤマダ'}
    kana_last_name{'タロウ'}
    birthday{Faker::Date.birthday} 
  end
end