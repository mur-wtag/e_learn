# frozen_string_literal: true

FactoryBot.define do
  factory :question_option do
    question
    content { Faker::Lorem.sentence }
  end
end
