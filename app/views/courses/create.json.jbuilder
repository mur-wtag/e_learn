# frozen_string_literal: true

json.course do |json|
  json.partial! 'courses/course', course: @course
end