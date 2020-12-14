FactoryBot.define do
  factory :item do
    name { Faker::Games::Pokemon.name }
    description { Faker::Games::Pokemon.move }
    unit_price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    merchant { Faker::Games::Zelda.character }
  end
end
