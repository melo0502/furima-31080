FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    name_sei { '山田' }
    name_name { '太郎' }
    name_sei_kana { 'ヤマダ' }
    name_name_kana { 'タロウ' }
    birthday { '1990-02-23' }
  end
end
