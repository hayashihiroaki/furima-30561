FactoryBot.define do
  factory :order_address do
    prefectures_id { 1 }
    postal_code { '111-1111' }
    city { '東京都' }
    house_number { '1-1' }
    phone_number { '11111111111' }
    building_name { '東京ハイツ' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
