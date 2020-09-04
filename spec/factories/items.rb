FactoryBot.define do
  factory :item do
    name              { "バッグ" }
    text              {Faker::Lorem.sentence}
    category_id       { 2 }
    item_status_id    { 2 }
    charge_id         { 3 }
    location_id       { 3 }
    shipping_id       { 2 }
    price             { 3000 }

    association :user
  end
end
