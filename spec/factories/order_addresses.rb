FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone { '09099991111' }
  end
end
