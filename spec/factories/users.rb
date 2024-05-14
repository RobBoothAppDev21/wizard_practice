FactoryBot.define do
  factory :user do
    sequence(:email, 100) { |n| "user-#{n}@example.com" }
    password { "super-secret" }

    confirmed_at { Time.zone.now }
  end
end
