FactoryBot.define do
  factory :user do
    sequence(:name){|n| "user#{n}" }
    sequence(:email){|n| "user#{n}@factory.com" }
    password { "Password1234" }
  end
end
