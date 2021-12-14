FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市' }
    block { '1-1' }
    building { 'シャーメゾン' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
