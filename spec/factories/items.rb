FactoryBot.define do
  factory :item do
    explanation { Faker::Lorem.sentence }
    title       { Faker::Lorem.sentence }
    category_id  { 2 }
    status_id { 2 }
    delivery_fee_id { 3 }
    ship_form_id { 2 }
    delivery_days_id { 2 }
    price { 333 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
