FactoryBot.define do
  factory :item do
    item { 'サンプル' }
    explanation { 'サンプルです' }
    category_id { 2 }
    status_id { 2 }
    delivery_charge_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    price { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end