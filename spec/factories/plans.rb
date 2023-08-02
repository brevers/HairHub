FactoryBot.define do
    factory :plan do
      agency { create(:agency) }
      title { "MyString" }
      description { "MyText" }
      image { "MyString" }
      price { 100 }
    end
  end
  