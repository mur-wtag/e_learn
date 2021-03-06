# frozen_string_literal: true

FactoryBot.define do
  factory :question_option do
    question
    content { Faker::Lorem.sentence }

    factory :correct_question_option do
      correct_answer { true }
    end
  end
end
