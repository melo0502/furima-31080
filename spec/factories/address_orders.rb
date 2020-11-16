FactoryBot.define do
  factory :address_order do
    building_name { Faker::Lorem.sentence }
    address { "青山1-1-1" }
    municipality { "横浜" }
    phone_number { 11111111111 }
    postal_code { "111-1111" }
    ship_form_id { 2 }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
