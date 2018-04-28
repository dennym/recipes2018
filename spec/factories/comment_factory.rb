FactoryBot.define do

  factory :comment do
    description "Cool"
    association :user
    association :recipe
  end

end
