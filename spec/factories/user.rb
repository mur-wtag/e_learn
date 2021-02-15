# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "asdasd123123" }

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    factory :teacher do
      after(:create) { |user| user.add_role(:admin) }
    end
  end
end
