FactoryBot.define do
  factory :order_address do
    token           { 'sample_token' }
    postal_code     { '123-4567' }
    prefecture_id   { 2 }
    city            { '函館' }
    house_number    { '1-1' }
    phone           { '09099991111' }
  end
end
