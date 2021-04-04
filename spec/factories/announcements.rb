FactoryBot.define do
  factory :announcement do
    title { "MyString" }
    body { "MyText" }
    kind { 1 }
    draft { false }
    published_at { "2021-02-11 16:12:21" }
  end
end
