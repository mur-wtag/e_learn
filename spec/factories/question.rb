# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    lesson
    content { Faker::Lorem.question }
  end
end
