# frozen_string_literal: true

json.completed_lesson do |json|
  json.partial! 'completed_lessons/completed_lesson', completed_lesson: @completed_lesson
end