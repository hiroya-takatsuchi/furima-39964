FactoryBot.define do
  factory :purchase_shipping_address do
    post_code { '123-4567' }
    shipping_area_id { 2 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    telephone { '1111111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
