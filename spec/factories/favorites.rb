FactoryBot.define do
  factory :favorite do
    country { "MyString" }
    recipe_link { "MyString" }
    recipe_title { "MyString" }
    user { nil }
  end
end
