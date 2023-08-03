FactoryBot.define do
    factory :promotion do
      code { "MyString" }
      ends_at { Time.now + 2.days }
    end
  end