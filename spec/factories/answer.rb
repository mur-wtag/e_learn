# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    user
    question
    content { Faker::Lorem.sentence }
    answered_question_option_ids { [] }
  end
end
