FactoryBot.define do
  sequence(:name) { |n| "first#{n}" }
  sequence(:email) { |n| "user#{n}@example.com" }
  sequence(:password) { |n| "password#{n}" }


  factory :user do
    name
    email
    password
    admin false
  end

  factory :admin, class: User do
    name
    password 
    email
    admin true
  end

end
