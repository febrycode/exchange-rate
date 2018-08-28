FactoryBot.define do
  factory :exchange_code do
    code_from { Faker::Currency.code }
    code_to { Faker::Currency.code }
  end
end