FactoryBot.define do
    factory :user do
      name { Faker::Name.unique.name }
      email { Faker::Internet.email }
      password { "123123" }
      password_confirmation { "123123" }
    end
  end
  