FactoryBot.define do
    factory :agency do
      user { create(:user) }
      name { Faker::Company.name }
      pitch { Faker::Company.catch_phrase }
      latitude { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
      longitude { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
      phone { Faker::PhoneNumber.phone_number }
    end
  end
  