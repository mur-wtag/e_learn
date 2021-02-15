# frozen_string_literal: true

json.lesson do |json|
  json.partial! 'lessons/lesson', lesson: @lesson
end
