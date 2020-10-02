FactoryBot.define do
  factory :item do
    name { '名前' }
    explanation { '説明' }
    price               { 1111 }
    category_id         { 1 }
    status_id           { 1 }
    delivery_charge_id  { 1 }
    shipment_source_id  { 1 }
    shipping_days_id    { 1 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
