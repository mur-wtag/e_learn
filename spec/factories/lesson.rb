# frozen_string_literal: true

FactoryBot.define do
  factory :lesson do
    course
    name { Faker::Name.name }
    content { Faker::Lorem.words }
  end
end
