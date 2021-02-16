# frozen_string_literal: true

FactoryBot.define do
  factory :completed_lesson do
    user
    lesson
  end
end
